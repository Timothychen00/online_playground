from project.models import *
from project.decorators import *
# print(
# Game.create_game(
#     {
#             "name":'pingpong',
#             "author":'timothy',
#             'description':'hhh',
#             'users_number':2,
#             'sync_mode':'auto',
#             'sync_variables':['1','2']
        
#     }
# )
# )
# db_model.db['games'].delete_one()
# print(1)
           
# print(
# Game.edit_game({'name':'pingpong'},
#     {
#             "name":'pingpong',
#             "author":'timothychen',
#             'description':'nmsl',
#             'sync_variables':['1','2','3']
        
#     }
# )
# )


# print(
# Room.create_room(
    
#     {
#             'sid':'12322322322',#6碼
#             "game":'pingpong',
#         }
        
    
# )
# )
db_model.cachable=True
@timing
def speed_test():
    for i in range(1000):
        
        Room.get_room({'status':'waiting'},isSingle=False)
speed_test()

