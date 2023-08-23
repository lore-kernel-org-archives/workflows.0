Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992C9C7113B
	for <workflows@archiver.kernel.org>; Wed, 23 Aug 2023 23:22:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238552AbjHWXV6 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 23 Aug 2023 19:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238112AbjHWXVa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 23 Aug 2023 19:21:30 -0400
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2042C10C1
        for <workflows@vger.kernel.org>; Wed, 23 Aug 2023 16:21:27 -0700 (PDT)
Received: from [192.168.50.162] ([146.241.122.243])
        by Aruba Outgoing Smtp  with ESMTPSA
        id YxADqkv3LgpIyYxADqIrFg; Thu, 24 Aug 2023 01:21:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1692832886; bh=x0NVR7vwQ6ndFSL0EODyBoG3HOFACX32W7eFtOgox6o=;
        h=Date:MIME-Version:Subject:To:From:Content-Type;
        b=a1ZTWOcKsMdWuP4XfrphtrdvwbKjmQqDeOoT2bIIxasKEhwkCKLU+1S+7FEXsl15f
         QZ+q2tuFYncfKePPIdYH69lxyQETZ4x6qv5lwRbOgrV2WiVndPaVYKkf0kSp2cqt98
         OMKhaCG43KVVbdO1+474FQye/3dQZbGGftbiH4H8IQsduNrwGsDm2segl3/HsxJdip
         IfiuU4PIe49clyT3cStPMPI4Xz8SXbJocMNAA0q7yMncadQrMB4M7SAiBP1vstnWsn
         jI5i4hHtGO43kSGFxI8uBtUZJNY70ySO2oLWVuyEaPAWr/hcnqnIP5fIYXX6JIisws
         0Wr9xUFFBB2Tg==
Message-ID: <ec9dc728-c8ea-a88e-7760-3b562397f09f@benettiengineering.com>
Date:   Thu, 24 Aug 2023 01:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 1/1] docs: submitting-patches: Add Sponsored-by tag to
 give credits to who sponsored the patch
Content-Language: en-US
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230817220957.41582-1-giulio.benetti@benettiengineering.com>
 <20230817220957.41582-2-giulio.benetti@benettiengineering.com>
 <20230817232348.GC1175@pendragon.ideasonboard.com>
 <28289906-4fd1-26aa-b1c4-eb393ac52d48@benettiengineering.com>
 <CAMuHMdVY7vaU8wpJrMD4HNkQwkJD0Rd9sL-xFDYXxJEcP91yuw@mail.gmail.com>
 <878ra4bv9s.fsf@toke.dk>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <878ra4bv9s.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFU6h4hWZ1lmhkaj0/cme0+g6GNzVqgxn10kCuOXhGdA2MajY9O1PW9MF22NcAT8upk08Op6mUQFUJxJZ4CsLHsDVMGMpw0dtdlqWF8vz/GArOQ46f2D
 ZG9+IM2/oAZqbLTmu4dbi7XRGHTOWgfF6LlRPEyz0Zc7us1eAuF9r4zD0qKjid4//wlQ+lZBHAb1SejT98GZcIztwZh/Rn8gBkKSy1PwF4HsUtuUK0ubSE1f
 ACHZz+/BepJU32riEGdhKcBimv4TX4uyvADS5Go1jdIBAmX2PIa5YVYtV4SmaY29RMHSbkhgndSGg1042+nxWjm2p9z70pl4wsno58pJvG8db+h+kGPO/nE6
 +qMqN5bykjZfPQ9jXt0U6S7UXXD6GzgpV3c1asqSn06uqNBEed4QFySVvhtgHewrpbFTuo6O22kFOmp2JMUyk4zbbJkg9w==
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello Toke, All,

On 21/08/23 11:27, Toke Høiland-Jørgensen wrote:

[ SNIP ]

>>
>> This is also causing more work for maintainers: now they have to check
>> if any Sponsored-by tags are present, and track if there is a response
>> with a matching Acked-by tag...
>>
>> And obviously they should postpone applying the patch until a
>> confirmation response is sent... which may never happen...
> 
> Yeah, definitely not going to track that. I'm pretty agnostic to the tag
> itself, but please don't put the burden of validity testing of it on
> maintainers...

yes, I've realized only later what could this imply for Maintainers and
for Customers too in the end.

Thank you for replying!
Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
