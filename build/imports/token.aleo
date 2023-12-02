program token.aleo;

record token:
    owner as address.private;
    amount as u64.private;


mapping account:
	key as address.public;
	value as u64.public;

function get_self_address:
    output self.caller as address.private;


function self_mint_public:
    input r0 as u64.public;
    async self_mint_public self.caller r0 into r1;
    output r1 as token.aleo/self_mint_public.future;

finalize self_mint_public:
    input r0 as address.public;
    input r1 as u64.public;
    get.or_use account[r0] 0u64 into r2;
    add r2 r1 into r3;
    set r3 into account[r0];


function self_mint_private:
    input r0 as u64.private;
    cast self.caller r0 into r1 as token.record;
    output r1 as token.record;


function transfer_public:
    input r0 as address.public;
    input r1 as u64.public;
    async transfer_public self.caller r0 r1 into r2;
    output r2 as token.aleo/transfer_public.future;

finalize transfer_public:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as u64.public;
    get.or_use account[r0] 0u64 into r3;
    sub r3 r2 into r4;
    set r4 into account[r0];
    get.or_use account[r1] 0u64 into r5;
    add r5 r2 into r6;
    set r6 into account[r1];


function transfer_private:
    input r0 as token.record;
    input r1 as address.private;
    input r2 as u64.private;
    sub r0.amount r2 into r3;
    cast r0.owner r3 into r4 as token.record;
    cast r1 r2 into r5 as token.record;
    output r4 as token.record;
    output r5 as token.record;
