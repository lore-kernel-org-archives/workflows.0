Return-Path: <SRS0=479y=XX=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C331EC4360C
	for <workflows@archiver.kernel.org>; Sat, 28 Sep 2019 23:17:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88A432146E
	for <workflows@archiver.kernel.org>; Sat, 28 Sep 2019 23:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3W5bjr0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbfI1XRJ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 28 Sep 2019 19:17:09 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35550 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728666AbfI1XRI (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 28 Sep 2019 19:17:08 -0400
Received: by mail-lj1-f195.google.com with SMTP id m7so5844790lji.2
        for <workflows@vger.kernel.org>; Sat, 28 Sep 2019 16:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IHaU06619HehZodKQ/VkJXibbWBSGF0c8g9ofALa1hk=;
        b=k3W5bjr01bmbrH5TJfbFczJISm1ODuAqaytlYS/YVmgqNvtTLl8kIYclTPJrfNuskK
         42Bon9p/9KSbGSCvYGOYm1Xh7QnislwruIcOOxBNCS2oGUhqPwW/cQrRpTyfA9auuBi3
         SqlUNsTxgwcbOvyWZ/kqH4UKjR3BW2/jWr1I/tGO/w2dSew501QwDa2pp/ReDInPgQAU
         /J2UgxeaPqe4l/jY4w2AvRcP/ekidnQ23bOIFvk9cKyW5LjPo3BghB3py86+uOPs4JxN
         1+sX5BO+IvnE8rV4b3x+T8rSPSWvKNiJUmVXr295D+4lv/dwEpXinhObSGHzaxNOoiFS
         EvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IHaU06619HehZodKQ/VkJXibbWBSGF0c8g9ofALa1hk=;
        b=XGAGnpd0NcbpW5U8V4QhRDmw02t29Nm7ibK4i8gDNPyFwOq0mIEf57MKXqzt7zzcIv
         KVvayJFsSwV5a0OF4Mzjm94RpSsefgllbJ26tIBqndTbXdJuysDT3Dq2KDP5U7Vozl/I
         IZOCpqwyLkT0U3ZNT1vIbQ8KGAIANl028YRFBxWWrUo3+05X7DXweD7kVRGIrNBfQDIk
         90eNKp0ICZuW0GktbtrybZ6CL4aF0IOPbFW6T4izM0FpTkKpD9plVbixstaswOzEsm7G
         n+SqsfC39SDqQnyYajym0Bq3fZKa8PkKBRylagSFAH2wYTAs5wneJOd/SUaEf4d0Jnwy
         RzNQ==
X-Gm-Message-State: APjAAAWMucsJZswpTjx7xuiyC8auf3YZtQYUwwThSxloevAHzXbRiJxC
        QYfMw3TYYZHgntidVD2629sIp5x+SyHqnlMHGngJGg==
X-Google-Smtp-Source: APXvYqzxJAKAlU5+ytvW4I2NwQ54UBb9gFczluqQmVP3G1P7uaBjzK6au1gk00uyfBwy80++7HPMeqhZnJY0N8OmLCU=
X-Received: by 2002:a2e:3808:: with SMTP id f8mr7301917lja.7.1569712625042;
 Sat, 28 Sep 2019 16:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20190924185312.GD6041@hmswarspite.think-freely.org>
 <20190924202423.GA14425@pendragon.ideasonboard.com> <20190924222502.GA11633@hmswarspite.think-freely.org>
 <20190925205036.GA7763@pendragon.ideasonboard.com> <20190926004045.GA20302@localhost.localdomain>
 <20190928185848.76c85a9d@oasis.local.home>
In-Reply-To: <20190928185848.76c85a9d@oasis.local.home>
From:   Dave Airlie <airlied@gmail.com>
Date:   Sun, 29 Sep 2019 09:16:53 +1000
Message-ID: <CAPM=9tzbwop5Wv9u5d2rDz_-eUmfckJdYff4WVnmAZKf-yBXXw@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Neil Horman <nhorman@tuxdriver.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, 29 Sep 2019 at 09:10, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 25 Sep 2019 20:40:45 -0400
> Neil Horman <nhorman@tuxdriver.com> wrote:
>
> > Eventually, barring any really significant objection, hes going to make
> > the switch, and users will either have to get github accounts, or stop
> > participating in netdev development.
>
> That will be a very sad day if that happened.
>
> Whatever service should have an email interface. For example, if I get
> a message from bugzilla.kernel.org, I can reply back via email and it
> is inserted into the tool (as I see my Out of office messages going
> into it. I need to fix my scripts not to reply to bugzilla).
>
> I set up patchwork on my INBOX, as I'm having a hard time of separating
> patches from the noise. And it works really well. I would love to be
> able to push my patchwork list to a public place so that others can see
> it too. As mentioned in the Maintainers Summit, it would be great to be
> able to pull patchwork down to my laptop, get on the plane, process a
> bunch of patches while flying, and then when I land, I could push the
> updates to the public server.
>
> That's pretty much all I'm looking for.

How many patches is your workflow btw? 20 a month? 50?

I think the reason davem and my group have in using git(hub/lab) is
our patch counts are way higher. You guys are inventing solutions for
your problems that's great, but they don't scale.

Patchwork as currently sold still requires someone to spend time
cleaning it up a lot, which is fine if you get 20-30 mails, when you
1-2k mails patchwork manual interactions end up taking a large chunk
of time. The and the fact that there is one patchwork, everyone has
forked it to add their favourite features. Unless someone spends time
on a reboot and goes around bringing all the forks back to a central
line, which is is a significantly larger task than if it has been
maintained in the first place, because now everyone has their own
niche hacks and cool features they can't do without, but are all
different than everyone elses.

Dave.
