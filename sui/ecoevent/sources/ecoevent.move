module ecoevent::ecoevent{
    use sui::object::{Self, UID, ID};
    use sui::tx_context::{Self, TxContext};
    use sui::vec_map::{Self, VecMap};
    use std::string::{Self, String};
    use sui::transfer;
    use std::hash;
    use std::vector;

    // Structs
    struct UserInfo has key, store {
        id: UID,
        name: String,
        username: String,
        password: String,
        email: String,
        mobile: String
    }
    
    struct EcoEvent has key, store {
        id: UID,
        creator: address,
        title: String,
        description: String,
        from_date: String,
        to_date: String,
        longtitude: String,
        latitude: String,
        votes: vector<Vote>
    }

    struct UserRepository has key {
        id: UID,
        users: VecMap<ID, UserInfo>
    }

    struct EcoEventRepository has key {
        id: UID,
        events: VecMap<ID, EcoEvent>
    }

    struct Vote has copy, store, drop {
        voter: address
    }

    
    // functions

    fun init(ctx: &mut TxContext) {
        transfer::transfer(
            EcoEventRepository{
                id: object::new(ctx),
                events: vec_map::empty()
            }, tx_context::sender(ctx)
        );

        transfer::transfer(
            UserRepository{
                id: object::new(ctx),
                users: vec_map::empty()
            }, tx_context::sender(ctx)
        );
    }

    public fun get_repositories(ctx: &mut TxContext) {
        transfer::transfer(
            EcoEventRepository{
                id: object::new(ctx),
                events: vec_map::empty()
            }, tx_context::sender(ctx)
        );

        transfer::transfer(
            UserRepository{
                id: object::new(ctx),
                users: vec_map::empty()
            }, tx_context::sender(ctx)
        );
    }

    public fun create_user(
        repository: &mut UserRepository,
        full_name: vector<u8>,
        user_name: vector<u8>,
        pass_word: vector<u8>,
        email_address: vector<u8>,
        mobile_phone: vector<u8>,
        ctx: &mut TxContext
        ){
            let new_user = UserInfo {
                id: object::new(ctx),
                name: string::utf8(hash::sha2_256(full_name)),
                username: string::utf8(user_name),
                password: string::utf8(hash::sha2_256(pass_word)),
                email: string::utf8(hash::sha2_256(email_address)),
                mobile: string::utf8(hash::sha2_256(mobile_phone))
            };

            let users = &mut repository.users;
            vec_map::insert(
                users,
                object::uid_to_inner(&new_user.id)
                , new_user
                );
    }

    public fun create_event(
        event_repo: &mut EcoEventRepository,
        title: vector<u8>,
        description: vector<u8>,
        from: vector<u8>,
        to: vector<u8>,
        longtitude: vector<u8>,
        latitude: vector<u8>,
        ctx: &mut TxContext
    ){
        let new_event = EcoEvent {
            id: object::new(ctx),
            creator: tx_context::sender(ctx),
            title: string::utf8(title),
            description: string::utf8(description),
            from_date: string::utf8(from),
            to_date: string::utf8(to),
            longtitude: string::utf8(longtitude),
            latitude: string::utf8(latitude),
            votes: vector::empty()
        };
        vec_map::insert(
            &mut event_repo.events,
            *object::uid_as_inner(&new_event.id),
            new_event
            );
    }


    public fun vote_event(
        event_id: &EcoEvent,
        event_repo: &mut EcoEventRepository,
        ctx: &mut TxContext
    ){
        let event = vec_map::get_mut(&mut event_repo.events, object::uid_as_inner(&event_id.id));

        let voter_address = tx_context::sender(ctx);
        vector::insert(&mut event.votes,Vote{voter: voter_address}, 0);
    }

    
}