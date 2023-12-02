# program_record_test.aleo

This program is used to show that:

- a program can be assigned record
- but the program can not spend the record


## Run Guide

1. Show the signer's address and the `program_record_test.aleo` program's address:

```bash
leo run show_address

# ➡️  Outputs

#  • aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy
#  • aleo1uerp09cg8dpy34xgqezgyyune79df2asm9j9eh25ek9z8aff7g9saej5kt

```

2. the `program_record_test.aleo` program mint public token and successfully transfer it:

```bash
leo run mint_public_then_transfer 2u64

# ➡️  Output

#  • {
#   program_id: program_record_test.aleo,
#   function_name: mint_public_then_transfer,
#   arguments: [
#     {
#       program_id: token.aleo,
#       function_name: self_mint_public,
#       arguments: [
#         aleo1uerp09cg8dpy34xgqezgyyune79df2asm9j9eh25ek9z8aff7g9saej5kt,
#         2u64
#       ]
#     },
#     {
#       program_id: token.aleo,
#       function_name: transfer_public,
#       arguments: [
#         aleo1uerp09cg8dpy34xgqezgyyune79df2asm9j9eh25ek9z8aff7g9saej5kt,
#         aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy,
#         2u64
#       ]
#     }
  
#   ]
# }

```
3. the `program_record_test.aleo` program can mint private token but failed to transfer it:

```bash
leo run mint_private 2u64

# ➡️  Output

#  • {
#   owner: aleo1uerp09cg8dpy34xgqezgyyune79df2asm9j9eh25ek9z8aff7g9saej5kt.private,
#   amount: 2u64.private,
#   _nonce: 3732124745318921135953997350128117252880740743054453751221417898383984623395group.public
# }

```

try transfer the record but failed:

```bash
leo run mint_private_then_transfer 2u64

#        Leo ✅ Compiled 'main.leo' into Aleo instructions
#        Leo ✅ Compiled 'token.leo' into Aleo instructions

# Error [ECLI0377010]: Failed to execute the `run` command.
# SnarkVM Error: Failed to execute instruction (call token.aleo/transfer_private r1 self.signer r0 into r2 r3;): Input record for 'token.aleo' must belong to the signer
```



