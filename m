Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33355C4CECE
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 07:42:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0480320673
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 07:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gandi.net header.i=@gandi.net header.b="s8nMbzAA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfJNHmi (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 03:42:38 -0400
Received: from mail12.gandi.net ([217.70.182.73]:32827 "EHLO gandi.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725934AbfJNHmi (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 14 Oct 2019 03:42:38 -0400
Received: from diconico07.dev (unknown [IPv6:2001:4b98:beef:a:e921:9c91:35ed:759a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by gandi.net (Postfix) with ESMTPSA id 72CD016034F;
        Mon, 14 Oct 2019 07:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gandi.net; s=20190808;
        t=1571038955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4D2Q9GZ1MblfvGhSA37Onprki/shE6Hqs7cAzbtuPW8=;
        b=s8nMbzAAKBfPvQ4RsCS/ApbaJSP+S04CWM9JoHg5Uj8nJWIEKrryXV2yphy16H4Tx5zXU6
        Q4Y4QUsCvTxwQDAR92KXBW9wcTg0NY14Tlp+guQbTl/lYZHcWqePsw04wTylyNTg/M6mql
        YaB9YcsGJJA0++dP/TcSysRKJOcu1slucEeC8mvVBu5bFPcL8CjyNk/T7QKuacESbHQJ2H
        t0izHyM+JqDLtOwHTHwXlaMkSnn9qAfWfiZcyE0RJ8F909f6aGsZaimqj1Te2oLKDmhZci
        +H5DDF6qsTaFRKIwf3iSyd90eULb7iNQv4f7LxBctPtHALU1USokmz8F4VqtZw==
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
To:     Dmitry Vyukov <dvyukov@google.com>,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Dmitry Vyukov <dvyukov@gmail.com>,
        Theodore Ts'o <tytso@mit.edu>, Rob Herring <robh@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stefan@datenfreihafen.org, Sasha Levin <sashal@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        David Miller <davem@davemloft.net>,
        Christian Brauner <christian@brauner.io>
References: <20190912120602.GC29277@pure.paranoia.local>
 <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local>
 <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local>
 <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
 <20191011083057.GA1074413@kroah.com>
 <CACT4Y+Y=w-vBCKn__ZVM_qk=vU9wactVQkCTLiVp+4OpJW2BgA@mail.gmail.com>
 <CACT4Y+aBJctHyR3EXRevOU6KCaAWFJO75Gr6yB_t-xeWZ8tjLg@mail.gmail.com>
 <20191011091812.68257184@gandalf.local.home>
 <20191011131917.mkq3n5332xlf6lhy@wittgenstein>
 <CACT4Y+ZinMiTq=PtA3ho9WNzvL0UW72FNMeSyY9_gkumjL0jVg@mail.gmail.com>
From:   Nicolas Belouin <nicolas.belouin@gandi.net>
Message-ID: <a0836974-15b6-e62f-59bb-95c6ebd95058@gandi.net>
Date:   Mon, 14 Oct 2019 09:42:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+ZinMiTq=PtA3ho9WNzvL0UW72FNMeSyY9_gkumjL0jVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



On 10/11/19 3:30 PM, Dmitry Vyukov wrote:
> On Fri, Oct 11, 2019 at 3:19 PM Christian Brauner
> <christian.brauner@ubuntu.com> wrote:
>> On Fri, Oct 11, 2019 at 09:18:12AM -0400, Steven Rostedt wrote:
>>> On Fri, 11 Oct 2019 11:33:35 +0200
>>> Dmitry Vyukov <dvyukov@google.com> wrote:
>>>
>>>>> Let's try to figure out time then.
>>>>> I propose the first day to not leave it to the last day and we may
>>>>> need some follow up discussions.
>>>>> On Monday I see Greg's keynote at 09:50 - 10:10. Steven's talk at
>>>>> 12:20 - 12:55. Sasha's talk at 12:20 - 12:55. Any other conflicts for
>>>>> people who want to attend?
>>>>> What about 10:30-11:30 (this covers a coffee break at 10:45-11:00, can
>>>>> prolong it to 12:00)? Any other time slot proposals?
>>>> +Christian also expressed interest, his talks are 14:25 - 15:50 and
>>>> 16:20 - 16:55 on Monday.
>>> If everyone's giving a talk on Monday, can we do this meeting on
>>> Tuesday?
>>>
>>> It's much easier to concentrate if you don't have to worry about a talk
>>> you are about to give (or just finished).
>> Seconded. :)
> It's not that there is nothing on Tue, it's just that I looked only on
> Monday schedule :)
> For Tue I see for potentially interested people:
> 09:00 - 09:20 Linus keynote
> 11:00 - 12:00 Shuah Office Hours
> 12:20 - 12:55 Rafael talk
> Anything else?
>
> Tue is fine with me, I just did not want to leave it to the last day
> because most likely it will take me a day to digest all info, so I
> will be able to reply something meaningful only the next day. It would
> be good to have some in-person conversations next day as well.
>
> Tue 14:00-15:00?
I'd like to be here too and this proposition fits well in my planned
schedule
