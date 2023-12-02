import token.aleo;
program program_record_test.aleo;



function show_address:
    call token.aleo/get_self_address into r0;
    output self.signer as address.private;
    output r0 as address.private;


function mint_public:
    input r0 as u64.public;
    call token.aleo/self_mint_public r0 into r1;
    async mint_public r1 into r2;
    output r2 as program_record_test.aleo/mint_public.future;

finalize mint_public:
    input r0 as token.aleo/self_mint_public.future;
    await r0;


function mint_public_then_transfer:
    input r0 as u64.private;
    call token.aleo/self_mint_public r0 into r1;
    call token.aleo/transfer_public self.signer r0 into r2;
    async mint_public_then_transfer r1 r2 into r3;
    output r3 as program_record_test.aleo/mint_public_then_transfer.future;

finalize mint_public_then_transfer:
    input r0 as token.aleo/self_mint_public.future;
    input r1 as token.aleo/transfer_public.future;
    await r0;
    await r1;


function mint_private:
    input r0 as u64.private;
    call token.aleo/self_mint_private r0 into r1;
    output r1 as token.aleo/token.record;


function mint_private_then_transfer:
    input r0 as u64.private;
    call token.aleo/self_mint_private r0 into r1;
    call token.aleo/transfer_private r1 self.signer r0 into r2 r3;
    output r2 as token.aleo/token.record;
    output r3 as token.aleo/token.record;
