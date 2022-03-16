from exceptions import SerializationError	
import urllib.parse

def __marshal_string(py_string):
	if type(py_string) == str: #Check if input is string

	#Find non-ascii characters and percent encode
		cplx_bit = 0
		lis = list(py_string)
		found = py_string.find('%')
		found1 = py_string.find(',')
		found2 = py_string.find('{')
		found3 = py_string.find('}')
		if found > -1:
			cplx_bit = 1
			spot = lis.index('%')
			py_string = py_string.replace(py_string[spot], '')
			py_string = py_string.replace(py_string[spot], '')
			py_string = py_string.replace(py_string[spot], '<null_byte>')
		else:
			pass

		if found1 > -1:
			cplx_bit = 1
			spot = lis.index(',')
			py_string = py_string.replace(py_string[spot], str(urllib.parse.quote(',')))
		else:
			pass

		if found2 > -1:
			cplx_bit = 1
			spot = lis.index('{')
			py_string = py_string.replace(py_string[spot], str(urllib.parse.quote('{')))
		else:
			pass

		if found3 > -1:
			cplx_bit = 1
			spot = lis.index('}')
			py_string = py_string.replace(py_string[spot], str(urllib.parse.quote('}')))
		else:
			pass
#==============================================================
		# Check for \x to make %
#		x = py_string.find("\\\\")
#		py_string = py_string.decode('UTF-8','ignore')
#		print(x)
#==============================================================
	# Check cplx_bit to see if string was complex
		if cplx_bit == 0:
			ret = py_string + 's'
		else:
			ret = py_string
		
	else:    
		raise SerializationError('Error in __marshal_string (Not type(str))')
	
	return ret

def __marshal_integer(py_int):
	if type(py_int) == int:
		ret = 'i' + str(py_int)
	elif py_int.isnumeric():
		ret = 'i' + py_int
	else:
		raise SerializationError('Error in __marshal_integer')
	
	return ret

def __marshal_map(py_dict):
	ret = '{'

	for key, value in py_dict.items():
		if type(value) == dict:
			ret += key + ':' + __marshal_map(value) + ','
		elif type(value) == str:
			if value.isnumeric():
				ret += key + ':' + __marshal_integer(value) + ','
			else:
				ret += key + ':' + __marshal_string(value) + ','
		elif type(value) == int:
			ret += key + ':' + __marshal_integer(value) + ','
		else:
			raise SerializationError('Error in __marshal_map')
	ret = ret[:-1]
	ret += '}'
	return ret

def marshal(unmarshalled_state):
	if unmarshalled_state == {}:
		unmarshalled_state_marshalled = '{}'
#========================================================#
	else:
		if unmarshalled_state is None:
			raise SerializationError('Input is None')
		if type(unmarshalled_state) != dict:
			raise SerializationError('Input is not a dict')
#========================================================#
		if type(unmarshalled_state) == dict:
			unmarshalled_state_marshalled = __marshal_map(unmarshalled_state)

	return unmarshalled_state_marshalled
