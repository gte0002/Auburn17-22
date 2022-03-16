"""
YOU MAY CHANGE THIS FILE IN ANY WAY YOU SEE FIT.

This includes adding new functions, removing functions, altering functions, etc
as long as it matches the expectations described in the assignment.
"""
import pytest
from serialization import marshal
from deserialization import unmarshal
from exceptions import SerializationError, DeserializationError

def test_case_a():
    # TODO: Delete the example prior to submission.
    got = unmarshal('{a:abcd}')
    assert(got == 0) #Throw error or someting

def test_case_b():
    # TODO: Delete the example prior to submission.
    got = unmarshal('{}')
    assert(got == {})

def test_case_c():
    # TODO: Delete the example prior to submission.
    got = marshal({}
    assert(got == '{}')

def test_case_d():
    # TODO: Delete the example prior to submission.
    got = unmarshal('{}')
    assert(got == {})

def test_case_e():
    # TODO: Delete the example prior to submission.
    got = marshal({}
    assert(got == '{}')
