# encoding: utf-8
require 'spec_helper'

describe Pingilish do

  it 'has a version number' do
    expect(Pingilish::VERSION).not_to be nil
  end

  describe '#to_default'	do
    let(:input) {'نیکی چو از حد بگذرد نادان خیال بد کند.'}
    let(:output) {subject.to_default(input)}


    it 'convert farsi to pinglish' do
      expect(output).to eq("ny ky  cho az hd bgzrd nadan khy al bd knd.")

    end
  end

  describe '#to_farsi'	do
    let(:input) {"nabordeh ranj ganj moiasar namishawad"}
    let(:output) {subject.to_farsi(input)}

    it 'convert piniglish to farsi' do
      expect(output).to match("نبرده رنج گنج میسر نمیشود ")

    end
  end
end
