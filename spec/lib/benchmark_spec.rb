require 'spec_helper'

describe '#benchmark' do
	let(:random){Array.new(1*rand(3..100)) {|i| 1*rand(0..1000000)}}
	let(:small){[5,1,3]}
	let(:large){Array.new(3000) {|i| 1*rand(0..1000000)}}
	let(:sorted){[0,1,2,3,4,5,6,7,8,9]}
	let(:reversed){[9,8,7,6,5,4,3,2,1,0]}
	let(:sorted_large){(0..3000).to_a}
	let(:reversed_large){(0..3000).to_a.reverse}

	it 'returns execution times for sorting an array n times' do
		expect do
			p benchmark(small)
		end.to_not raise_error
	end

	it 'takes a random array of integers' do
		expect do
			p benchmark(random, 10)
		end.to_not raise_error
	end

	it 'takes an array that is small' do
		expect do
			p benchmark(small)
		end.to_not raise_error
	end

	it 'takes an array that is sorted' do
		expect do
			p benchmark(sorted)
		end.to_not raise_error
	end

	it 'takes an array that is reversed' do
		expect do
			p benchmark(reversed)
		end.to_not raise_error
	end

	it 'takes an array that is large' do
		expect do
			p benchmark(large, 1)
		end.to_not raise_error
	end

	it 'takes an array that is large and sorted' do
		expect do
			p benchmark(sorted_large, 1)
		end.to_not raise_error
	end

	it 'takes an array that is large and reversed' do
		expect do
			p benchmark(reversed_large, 1)
		end.to_not raise_error
	end
end