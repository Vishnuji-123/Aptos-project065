module MyModule::LearningSandbox {

    use aptos_framework::signer;

    /// Struct to hold learner progress for sandbox experiments
    struct Learner has key, store {
        lessons_completed: u64,
    }

    /// Function to create a new learner sandbox profile
    public fun create_profile(account: &signer) {
        let profile = Learner {
            lessons_completed: 0,
        };
        move_to(account, profile);
    }

    /// Function to mark progress by incrementing lessons completed
    public fun complete_lesson(account: &signer) acquires Learner {
        let profile = borrow_global_mut<Learner>(signer::address_of(account));
        profile.lessons_completed = profile.lessons_completed + 1;
    }
}
