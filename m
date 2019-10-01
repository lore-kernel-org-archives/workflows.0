Return-Path: <SRS0=W/h6=X2=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A87C32793
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 03:22:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D7702133F
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 03:22:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="Ymo95siq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729131AbfJADWS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 23:22:18 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45908 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727645AbfJADWR (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 23:22:17 -0400
Received: by mail-pl1-f195.google.com with SMTP id u12so4756417pls.12
        for <workflows@vger.kernel.org>; Mon, 30 Sep 2019 20:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=hQjsDMc3HO0ctN+Fw+nmw0/WQf4UyGCi7ACdXHnP76U=;
        b=Ymo95siqHP5RXCZUNq117p8HubmwQYTrTiva1meCg+lNbHkM601/G+jflquf3vJVQ5
         kATADtyQLpTBp8Dc+5TX0b5sZxdnyFv3DY4falxYw9TeIu0NCID+znQp16/TIvqGe/FI
         LTP55jVC8U+7ZQfsRoSNxoifEPSdb9CDS4x98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=hQjsDMc3HO0ctN+Fw+nmw0/WQf4UyGCi7ACdXHnP76U=;
        b=QPKlvhx0V1z9fqBCLV7E3So9S9JXOEjowZT8Rg0LTB/dTrpyrwfnvsOf5pdcnptov4
         GWdy73RMEQjf5FGWBi+1WPUWxvNcUv6jDLM8KnrpUK8T2/tqd4AmCz5VA2+Q0NlAjiuk
         J3tBH9DwgQxSVACxXaZGPi1CazlM6czWxifa4BrY1eL81456mKmeskN/0y3UJWxs4z+c
         4vEcGFzcExWTV+B6yxroSiwbuZ/vhxANtdeYRkg0YZ2vhmf5G1fAgmxuuE43EJXRk4iV
         wNxwkp8OhJKcCvmwcf55yp3Oycda4cShFlHmc1aDWDAbAwwdqpZypAV80/UfXTrkXHjm
         6oOw==
X-Gm-Message-State: APjAAAUtNQRSNF68EmsMvk708nWcDb0417o56mbBjwS+V5kD5NsL80O+
        BycV9zhSBoVg4Lh7p4iws79OnA==
X-Google-Smtp-Source: APXvYqz9N7pRa463hAMKpGq+T6iBsv7ZkfjlEsXVq2mI7IUCbmGRdkvhrw+xlC2c84H1yCvQXuT40Q==
X-Received: by 2002:a17:902:fe0e:: with SMTP id g14mr23951688plj.285.1569900136857;
        Mon, 30 Sep 2019 20:22:16 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id g19sm22125713pgm.63.2019.09.30.20.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 20:22:15 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Dave Airlie <airlied@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Neil Horman <nhorman@tuxdriver.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
In-Reply-To: <CAPM=9tzbwop5Wv9u5d2rDz_-eUmfckJdYff4WVnmAZKf-yBXXw@mail.gmail.com>
References: <20190924182536.GC6041@hmswarspite.think-freely.org> <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20190924185312.GD6041@hmswarspite.think-freely.org> <20190924202423.GA14425@pendragon.ideasonboard.com> <20190924222502.GA11633@hmswarspite.think-freely.org> <20190925205036.GA7763@pendragon.ideasonboard.com> <20190926004045.GA20302@localhost.localdomain> <20190928185848.76c85a9d@oasis.local.home> <CAPM=9tzbwop5Wv9u5d2rDz_-eUmfckJdYff4WVnmAZKf-yBXXw@mail.gmail.com>
Date:   Tue, 01 Oct 2019 13:22:09 +1000
Message-ID: <87eezx40bi.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Dave Airlie <airlied@gmail.com> writes:

> On Sun, 29 Sep 2019 at 09:10, Steven Rostedt <rostedt@goodmis.org> wrote:
>>
>> On Wed, 25 Sep 2019 20:40:45 -0400
>> Neil Horman <nhorman@tuxdriver.com> wrote:
>>
>> > Eventually, barring any really significant objection, hes going to make
>> > the switch, and users will either have to get github accounts, or stop
>> > participating in netdev development.
>>
>> That will be a very sad day if that happened.
>>
>> Whatever service should have an email interface. For example, if I get
>> a message from bugzilla.kernel.org, I can reply back via email and it
>> is inserted into the tool (as I see my Out of office messages going
>> into it. I need to fix my scripts not to reply to bugzilla).
>>
>> I set up patchwork on my INBOX, as I'm having a hard time of separating
>> patches from the noise. And it works really well. I would love to be
>> able to push my patchwork list to a public place so that others can see
>> it too. As mentioned in the Maintainers Summit, it would be great to be
>> able to pull patchwork down to my laptop, get on the plane, process a
>> bunch of patches while flying, and then when I land, I could push the
>> updates to the public server.
>>
>> That's pretty much all I'm looking for.
>
> How many patches is your workflow btw? 20 a month? 50?
>
> I think the reason davem and my group have in using git(hub/lab) is
> our patch counts are way higher. You guys are inventing solutions for
> your problems that's great, but they don't scale.
>
> Patchwork as currently sold still requires someone to spend time
> cleaning it up a lot, which is fine if you get 20-30 mails, when you
> 1-2k mails patchwork manual interactions end up taking a large chunk
> of time. The and the fact that there is one patchwork, everyone has
> forked it to add their favourite features. Unless someone spends time
> on a reboot and goes around bringing all the forks back to a central
> line, which is is a significantly larger task than if it has been
> maintained in the first place, because now everyone has their own
> niche hacks and cool features they can't do without, but are all
> different than everyone elses.

/me puts on upstream patchwork maintainer hat

Hi!

What sort of manual interactions are you doing with patchwork and what
would you like to see changed?

You're probably using the FDO fork, so I can't help with that, but I do
try to do some work on patchwork as I get time. It's not funded so it
has to fit around my actual kernel development job, but currently we're
working on sorting out a big chunk of technical debt that should make
things a lot easier in the future, so now would be a good time to get
your requests in.

Regards,
Daniel

>
> Dave.
