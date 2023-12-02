import token.leo;

program program_record_test.aleo {
    transition show_address() -> (address, address) {
        let signer: address = self.signer;
        let caller: address = token.leo/get_self_address();
        return (signer, caller);
    }

    transition mint_public(public amount: u64) {
        token.leo/self_mint_public(amount);
    }

    transition mint_public_then_transfer(amount: u64) {
        let receiver: address = self.signer;
        token.leo/self_mint_public(amount);
        token.leo/transfer_public(receiver, amount);
    }

    transition mint_private(amount: u64) -> token.leo/token {
        return token.leo/self_mint_private(amount);
    }

    transition mint_private_then_transfer(amount: u64) -> (token.leo/token, token.leo/token) {
        let receiver: address = self.signer;
        let sender: token = token.leo/self_mint_private(amount);
        return token.leo/transfer_private(sender, receiver, amount);
    }
}
