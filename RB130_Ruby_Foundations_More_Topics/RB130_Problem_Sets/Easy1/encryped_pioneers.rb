ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

UPPERCASE = (?A..?Z).to_a
LOWERCASE = (?a..?z).to_a


def rot13(string)
  string.each_char.reduce('') do |rot_string, char|
    rot_string + decipher_char(char)
  end
end

def decipher_char(char)
  return char unless LOWERCASE.include?(char.downcase)

  rot_index = (LOWERCASE.index(char.downcase) - 13) % 26
  LOWERCASE.include?(char) ? LOWERCASE[rot_index] : UPPERCASE[rot_index]
end



ENCRYPTED_PIONEERS.each { |pioneer| puts rot13(pioneer) }