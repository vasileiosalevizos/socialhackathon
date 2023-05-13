module ecoevent::ecoevent{
    use sui::object::{Self, UID, ID};
    use sui::tx_context::{Self, TxContext};
    use sui::vec_map::{Self, VecMap};
    use sui::vec_set::{Self, VecSet};
    use std::string::{Self, String};
    use sui::transfer;

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
        creator: ID,
        title: String,
        description: String,
        longtitude: String,
        latitude: String,
        votes: VecSet<ID>
    }

    struct UserRepository has key {
        id: UID,
        users: VecMap<ID, UserInfo>
    }

    struct EcoEventRepository has key {
        id: UID,
        events: VecMap<ID, EcoEvent>
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
                name: string::utf8(full_name),
                username: string::utf8(user_name),
                password: string::utf8(pass_word),
                email: string::utf8(email_address),
                mobile: string::utf8(mobile_phone)
            };

            let users = &mut repository.users;
            vec_map::insert(
                users,
                object::uid_to_inner(&new_user.id)
                , new_user
                );
    }

    public fun create_event(
        creator: &UserInfo,
        event_repo: &mut EcoEventRepository,
        title: vector<u8>,
        description: vector<u8>,
        longtitude: vector<u8>,
        latitude: vector<u8>,
        ctx: &mut TxContext
    ){
        let new_event = EcoEvent {
            id: object::new(ctx),
            creator: *object::uid_as_inner(&creator.id),
            title: string::utf8(title),
            description: string::utf8(description),
            longtitude: string::utf8(longtitude),
            latitude: string::utf8(latitude),
            votes: vec_set::empty()
        };
        vec_map::insert(
            &mut event_repo.events,
            *object::uid_as_inner(&new_event.id),
            new_event
            );
    }


    public fun vote_event(
        user_id: &ID,
        event_id: &ID,
        user_repo: &UserRepository,
        event_repo: &mut EcoEventRepository,
        _ctx: &mut TxContext
    ){
        let event = vec_map::get_mut(&mut event_repo.events, event_id);

        vec_set::insert(&mut event.votes, *user_id);
    }
}