from typing import Dict

class CustomerLibrary:
    
    @staticmethod
    def verify_customer_in_list(customers, email: str="") -> bool:
        """
        Verify whether a customer with the email is present in the list.
        """
        if not customers:
            return False
        for customer in customers:
            if (email and customer["email"] == email):
                return True
        return False