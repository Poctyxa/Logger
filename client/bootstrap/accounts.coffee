AccountsTemplates.removeField 'password'
AccountsTemplates.addField
  _id: 'password'
  type: 'password'
  required: true
  minlenght: 8

AccountsTemplates.addField
  _id: 'username'
  type: 'text'
  required: true
  re: /^[\w]{3,32}$/
  errStr: 'invalid username'

AccountsTemplates.addField
  _id: 'pin'
  type: 'password'
  minCount: 4
  maxCount: 4
  trim: true
  errStr: 'invalid PIN'
# 
# AccountsTemplates.addField
#   _id: 'pinLoginCount'
#   type: 'number'
#   min: 0
#   max: 4
#   defaultValue: 4
