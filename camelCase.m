function str = camelCase(str, reverse)
% converts underscore_compound_words to camelCase (default) and back when
% reverse == true
%
% Not always inversible
%
% str must be either mixed case or contain underscores but not both
%
% Examples:
%   camelCase('one')            -->  'one'
%   camelCase('one_two_three')  -->  'oneTwoThree'
%   camelCase('#$one_two,three') --> 'oneTwoThree'
%   camelCase('One_Two_Three')  --> !error! upper case only mixes with alphanumericals
%   camelCase('5_two_three')    --> !error! cannot start with a digit
%
% Reverse:
%   camelCase('oneTwoThree', true)    --> 'one_two_three'
%   camelCase('OneTwoThree', true)    --> 'one_two_three'
%   camelCase('one two three', true)  --> !error! white space is not allowed
%   camelCase('ABC', true)            --> 'a_b_c'

reverse = nargin>=2 && reverse;
assert(ischar(str) && ~isempty(str), 'invalid input')
assert(isempty(regexp(str, '\s+', 'once')), 'white space is not allowed')
assert(~ismember(str(1), '0':'9'), 'string cannot begin with a digit')

if reverse
    % from camelCase
    assert(~isempty(regexp(str, '^[a-zA-Z0-9]*$', 'once')), ...
        'camelCase string can only contain alphanumeric characters');
    str = regexprep(str, '([A-Z])', '_${lower($1)}');
    str = str(1+(str(1)=='_'):end);  % remove leading underscore
else
    % to camelCase
    assert(isempty(regexp(str, '[A-Z]', 'once')), ...
        'underscore_compound_words must not contain uppercase characters');
    %     str = regexprep(str, '(^|[_\W]+)([a-zA-Z])', '${upper($2)}');
    str = regexprep(str, '([_\W]+)([a-zA-Z])', '${upper($2)}');    
end