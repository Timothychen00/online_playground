from project.models import *

print(
Game.create_game(
    {
            "name":'pingpong',
            "author":'timothy',
            'description':'hhh',
            'users_number':2,
            'sync_mode':'auto',
            'sync_variables':['1','2']
        
    }
)
)
           
           
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
