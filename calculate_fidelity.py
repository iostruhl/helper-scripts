#! /usr/bin/python3

DEFAULT_TARGET = 6000.0

current_balance = float(input("Current balance: "))
target_balance = input(f"Target balance ({DEFAULT_TARGET:.2f}): ")
if target_balance == "":
    target_balance = DEFAULT_TARGET
else:
    target_balance = float(target_balance)

isaac_joint_spend = float(input("Isaac's joint spend: "))
sara_joint_spend = float(input("Sara's joint spend: "))

# The account total, before reimbursing joint expenses
total_before_reimburse = target_balance + isaac_joint_spend + sara_joint_spend
difference = total_before_reimburse - current_balance
owed_before_reimburse = difference / 2

# Isaac already paid Sara's joint spend, so he owes what we each owe and then is reimbursed Sara's amount.
isaac_owed = owed_before_reimburse - sara_joint_spend
# Vice versa for Sara
sara_owed = owed_before_reimburse - isaac_joint_spend

print(f"Isaac deposits {isaac_owed:.2f}")
print(f"Sara deposits {sara_owed:.2f}")
