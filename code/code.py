from abc import abstractmethod



class IAggregate:
    
    @abstractmethod
    def create_iterator(self,):
        pass



class FamillyMembers(IAggregate):

    def __init__(self, members):
        self.members = members

    def create_iterator(self):
        return FamillyMembersIterator(self)



class Iterator():

    @abstractmethod
    def next(self,):
        pass

    @abstractmethod
    def has_next():
        pass

class FamillyMembersIterator(Iterator):

    def __init__(self, familly_members):
        self.familly_members = familly_members
        self.current_index = -1

    @abstractmethod
    def next(self,):
        self.current_index += 1
        return self.familly_members.members[self.current_index]


    @abstractmethod
    def has_next(self):
        return len(self.familly_members.members) != (self.current_index+1)

if __name__ == "__main__":

    familly_members: IAggregate = FamillyMembers(['a', 'b', 'c', 'd'])

    familly_members_iter: Iterator = familly_members.create_iterator()

    while familly_members_iter.has_next():

        member = familly_members_iter.next()
        print(member)
