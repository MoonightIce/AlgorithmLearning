/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */

class Solution {
public:
    ListNode *detectCycle(ListNode *head) {
        var slow : ListNode?
        var quick : ListNode?

        while slow != quick {
            if slow.next != nil && quick.next.next != nil {
                slow = slow.next
                quick = quick.next.next
            }
        }

        quick = head

        while quick != slow {
            quick = quick.next
            slow = slow.next
        }

    return slow
    }
};