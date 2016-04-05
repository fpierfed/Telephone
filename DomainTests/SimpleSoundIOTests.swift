//
//  SimpleSoundIOTests.swift
//  Telephone
//
//  Copyright (c) 2008-2016 Alexey Kuznetsov
//
//  Telephone is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Telephone is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

@testable import Domain
import DomainTestDoubles
import XCTest

class SimpleSoundIOTests: XCTestCase {
    func testCanCreateWithSystemSoundIO() {
        let factory = SystemAudioDeviceTestFactory()
        let systemIO = SimpleSystemSoundIO(
            input: factory.someInput,
            output: factory.someOutput
        )

        let sut = SimpleSoundIO(soundIO: systemIO)

        XCTAssertTrue(sut.input == systemIO.input)
        XCTAssertTrue(sut.output == systemIO.output)
        XCTAssertTrue(sut.ringtoneOutput == systemIO.output)
    }
}