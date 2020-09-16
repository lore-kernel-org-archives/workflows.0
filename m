Return-Path: <SRS0=gPPl=CZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MALFORMED_FREEMAIL,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C57C433E2
	for <workflows@archiver.kernel.org>; Wed, 16 Sep 2020 07:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC3822076B
	for <workflows@archiver.kernel.org>; Wed, 16 Sep 2020 07:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4n7y5xK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgIPHXs (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Sep 2020 03:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgIPHXp (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Sep 2020 03:23:45 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBB4C06174A
        for <workflows@vger.kernel.org>; Wed, 16 Sep 2020 00:23:45 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id t16so5227541edw.7
        for <workflows@vger.kernel.org>; Wed, 16 Sep 2020 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=3qpS6WUSLKicnIX+rTZeMXvSPqkRlD+0MIrmHqHOoDI=;
        b=X4n7y5xKOMOU/dwRJujZO7VNGw8G8DGYjWCsEhnYGagFnYakPszjyFgUYD+fBRR10m
         EKLB/C/mh2HNPaJX5Xx4gG8q5TYtynwKwa3DsHcxNnMaNWlNUNX5URgncbrrwztD1pxF
         JPZ1zhlZD4eg2b+h5GNurod8AR5xYM7RPv0Lj0ry5E1ihdd0FW+jvg0Vd36k9ZLGlC7j
         RBuMRhl0odjmx0vQ8BjHH/zXW9nSk40Hxxbv9M0niOoZacOQOH9H7n953GWL2raHUcqi
         RkNJsHp/5i6x1Y9J674WcPFG7AtDbi8N8dgAzSRx+gTLbySjubkw0zblb2QCtGa5noh5
         L53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=3qpS6WUSLKicnIX+rTZeMXvSPqkRlD+0MIrmHqHOoDI=;
        b=T4QLMjpB53H9BKpOHQedA0EV+nzmjyjFvlZFdxG8uho3++Z1yXUzMX1CL3xo5i0Wjx
         UK6O4GBsbN5CybwzUJQ5hSouqC4opcbdkUcKVhRCZ9x7cj42ar/SGnRw7iiiOHBwp3yT
         IU9nJH4n+YEBIUK7PjEKoqmx+r+1VW70uqrxGGJ4br9Yh6wAmSseyAweuco1WxhUPpll
         J790EO2euUQo78BAavOajrnCbovFtgqyOT18mwwe1+PVKlw1ZHxl3dol5yED/6RVF/ES
         QP/oFkNlFg6PoDSWv+uuX4vPB0UYlxz6C12Hqil7fUhlADr1ICCafSw7quCkrWFuglTg
         ZIUg==
X-Gm-Message-State: AOAM531g7ZaZ4B6ZtZPmZ/NQwSqHCSvv4EYdAW+6jt9U5zdlb9qRTCxD
        ps+aE81kivdBw6e+sVth9FgvlKKUN++HBg==
X-Google-Smtp-Source: ABdhPJyHINVfAkzlOIaGZRzsNM2IlHYfVOsD53DSe89BrU61Lt3WQLVdBhdRQlLBgSCcJXbdBhGJ6A==
X-Received: by 2002:a50:cf46:: with SMTP id d6mr26475345edk.339.1600241023983;
        Wed, 16 Sep 2020 00:23:43 -0700 (PDT)
Received: from felia ([2001:16b8:2dec:c500:15b1:3554:3841:68b])
        by smtp.gmail.com with ESMTPSA id dm22sm13612485edb.49.2020.09.16.00.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 00:23:43 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Wed, 16 Sep 2020 09:23:42 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Dmitry Vyukov <dvyukov@google.com>
cc:     Himadri Pandya <himadrispandya@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        syzkaller <syzkaller@googlegroups.com>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Greg KH <gregkh@linuxfoundation.org>, workflows@vger.kernel.org
Subject: Re: Question regarding marking bugs as "invalid"
In-Reply-To: <CACT4Y+a0avH73Fc-391Ft=XB240wxYA4HokgXZPWoejMk0C=ig@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009160909240.10877@felia>
References: <CAOY-YVmJEQZhhOnC16bYyiow8z+B0o5FOsvQKmmXFqaaM-SAug@mail.gmail.com> <CAKXUXMzL6B+b0a6yDUSDdhV24jOaQZDiodbBW8OwgU=RCfDE_w@mail.gmail.com> <CACT4Y+b+aYP05PG32ofpXG1oXEFBgQ8CYnoDD5ccggOPwc39nw@mail.gmail.com> <CAOY-YVmYR70itmk6oNC_7L+o1kxfd2_W0EgCYn4KEQyGK-KPRw@mail.gmail.com>
 <CACT4Y+Yo_m9C1t7AHpVq+5E-RDejMQYpK2eZUk1JTTwo+Lf3-Q@mail.gmail.com> <CAOY-YV=Mfu2at2KzoGNszKSEyUpTHzBdbr-SjyVyE_BJBbw_uw@mail.gmail.com> <CACT4Y+a0avH73Fc-391Ft=XB240wxYA4HokgXZPWoejMk0C=ig@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



On Wed, 16 Sep 2020, Dmitry Vyukov wrote:

> On Tue, Sep 15, 2020 at 4:15 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> > > On Tue, Sep 15, 2020 at 3:23 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > Is it correct to mark bugs as "invalid" if they have reproducers but
> > > > > > > the reproducer doesn't trigger any issue on testing current status? If
> > > > > > > not, then what should be done about such bugs?
> > > > > > >
> > > > > > > Thanks & Regards,
> > > > > > > Himadri
> > > > > > >
> > > > > >
> > > > > > Himadri,
> > > > > >
> > > > > > if possible try to determine which commit fixed the issue the
> > > > > > reproducer triggered.
> > > > > >
> > > > > > You can potentially bisect with the reproducer on the git history or
> > > > > > you can simply look in the git log of the affected files if someone
> > > > > > mentioned fixing something related to the trigger.
> > > > > >
> > > > > > That helps to make sure we do not just close reproducers that just
> > > > > > need a lot of time, configuration or luck to hit a certain crash.
> > > > >
> > > > >
> > > > > Hi Himadri,
> > > > >
> > > > > Basically what Lukas said.
> > > > > Bulk closing all of them as "invalid" would be bad for several
> > > > > reasons. Either do some reasonable amount of degging, or wait for
> > > > > syzbot fix bisection, maybe it will shed some light. It should happen
> > > > > after 30 days since last crash IIRC. Also all testing requests/results
> > > > > are shown on the dashboard, so this bit of information is not lost.
> > > >
> > > > Understood.
> > > >
> > > > I incorrectly assumed(before posting this question) that I should mark
> > > > such bugs as invalid and sent the command to syzbot for one such bug.
> > > > Now I understand that it was not the right thing. It doesn't show on
> > > > the dashboard and I don't know how to undo it :(.
> > > >
> > > > Bug's dashboard link -
> > > > https://syzkaller.appspot.com/bug?id=4c7fd5b46451d957a3d8188f393f1982f9753fe7
> > >
> > > Hi Himadri,
> > >
> > > Transitions to terminal states are not undo-able. Consider the same
> > > bug is rediscovered concurrently with one undoing "#syz invalid". Now
> > > we have 2 versions of the same bug and it will be an incomprehensible
> > > mess.
> > >
> >
> > Understood. My sincerest apologies for being naive.
> >
> > My assumption was that commands like "invalid" are similar to the
> > action of submitting a patch, it would generate some discussion about
> > the bug and if it is really invalid, someone with authority(like
> > maintainers) would actually go and mark it as "invalid". I was clearly
> > mistaken. But if we don't have any gatekeeping on such commands and
> > anyone can directly change the status of the bug by merely sending an
> > email to syzbot, isn't it a security issue?
>

Himandri, it works through collective ignorance.

Basically, we assume that the evil people try to do something else :)

Now in case, somebody evil would try to do what you suggest, close some 
syzbot report although it is not fixed, it would simply be found again by 
syzkaller and hence there is a new report.

If you now close many issues and repeatedly do that, Dmitry would notice 
as he maintaining the system.

Usually, people are not evil, though, but just err.

Also, the public syzbot is only one of many instances of syzkaller/syzbot 
running. So, we would notice the mismatch between instances as well.
 
> +workflows
> 
> What you are saying is all true. There is no authorization and anybody
> can close any bug.
> 
> That's the process we could combine from parts we had. Implementing
> proper support with users/permissions/assignees would require:
> 1. Implementing support in syzbot
> 2. Implementing and deploying some form of user identity and
> authorization for kernel developers (emails is not a trusted media on
> its own)
> 3. Finding responsible maintainers for all parts of the kernel and
> making them do this additional work
> 
> All of these are problematic on different fronts. (2) can be replaced
> with use of Bugzilla, but it does not seem to make the problem easier
> overall. So so far we have the process we have.
> 

Dmitry, I agree. For tracking static analysis findings that are subject 
to even more false positive findings (and hence need more triage) and 
that are not automatically re-opened if someone closes them wrongly, this 
situation is as far as I see a real issue when collaborating.

Currently, I am thinking about just using emails or so as identities and 
then have workflows for every user to state who they trust and to which 
degree (just take the finding of X as true, show the rationale of Y but 
let me recheck, totally ignore Z's findings).

Certainly, such efforts and many others would benefit from some basic user 
identity management for kernel developers, though.


Lukas
