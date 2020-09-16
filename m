Return-Path: <SRS0=gPPl=CZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C803C433E2
	for <workflows@archiver.kernel.org>; Wed, 16 Sep 2020 06:01:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3EF22087D
	for <workflows@archiver.kernel.org>; Wed, 16 Sep 2020 06:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JwFDzXzD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgIPGBY (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Sep 2020 02:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgIPGBX (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Sep 2020 02:01:23 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AFCC06174A
        for <workflows@vger.kernel.org>; Tue, 15 Sep 2020 23:01:23 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id r8so5258543qtp.13
        for <workflows@vger.kernel.org>; Tue, 15 Sep 2020 23:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OoeG2Cuh9gthal8rs64Ej/KdXPHzzZUXoOB9MlAxsjU=;
        b=JwFDzXzDrTXDRMZhRWAYZenuirvIt49Iuuh5VLQigOrnpdBBiNcR1JIV6sut59a1nE
         W50r7iGSWrfT9ZRH3dWpcMe2AJEeMObGxTlCBcKwxLGOERgKOu6sQKV6ouQCDODXP95s
         UWms3e9G/ND2i0BnLHzp6dWGrKDpJY75Hpbm61gyvN6aoXSO5R1M6v5vqVRsIIWMtyzN
         szr3nxeAPjY4J7xLO1+58LMivwMMkqgsJzCnTT4xS9lWXyDb19Fbj5TrBJ8PnP+rRUuF
         +EXcpj2lrSTgt52jcvIh3rRK15ecVXchKoQCLIQc+M6Pb7wYTpFKMqJhjL03xd4a7nD6
         3WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OoeG2Cuh9gthal8rs64Ej/KdXPHzzZUXoOB9MlAxsjU=;
        b=p9493bppdisjIR35hmwYisCAf1kX4EYF2uPB4O4tW6I0bIsiUYqaCYoB92mw+1xOzk
         v4dAq5pL8f+CxmuX2U5ikr9YJ/mSpXDA7t+edmlz6eK1hBiQ6gWyFWyzvOniZzr+1cUb
         H7zQbnatHNHYvnfHvRR/6wKdi0+UxxND/7CJfMq8EY5bXHhL6iQezAJ5SE+86fdUuZhm
         mCNUPd6BOQaFVm5TiNAkS7GztzAHZQwh4e8wUPEexXKvbm5mVGeE/6Tgvr3OiALWRvDw
         J5RcJT4eGYAgFmx+faZpLrckvFXJXa1MXAyiWXjNLEwlGCPcQ9vgZZ/YReeIWgo6vZac
         RGZw==
X-Gm-Message-State: AOAM531RwPTB05PPoYOgxOZrePTnqjOtU1Z8iLaT72+Be0dqEPFOarlq
        ZP45UUngDz+sJfIt422s1OVvGW9iiDnqLsjgT9RnHA==
X-Google-Smtp-Source: ABdhPJyl98GRLrn9ReyZLdx9kfRUdABo8ZVVu499OsPCtdmw31K7QAW8HDoVT2dRTYGsWvKqngX0iiA4+ivMWiR0pGM=
X-Received: by 2002:ac8:4806:: with SMTP id g6mr9158036qtq.380.1600236082264;
 Tue, 15 Sep 2020 23:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAOY-YVmJEQZhhOnC16bYyiow8z+B0o5FOsvQKmmXFqaaM-SAug@mail.gmail.com>
 <CAKXUXMzL6B+b0a6yDUSDdhV24jOaQZDiodbBW8OwgU=RCfDE_w@mail.gmail.com>
 <CACT4Y+b+aYP05PG32ofpXG1oXEFBgQ8CYnoDD5ccggOPwc39nw@mail.gmail.com>
 <CAOY-YVmYR70itmk6oNC_7L+o1kxfd2_W0EgCYn4KEQyGK-KPRw@mail.gmail.com>
 <CACT4Y+Yo_m9C1t7AHpVq+5E-RDejMQYpK2eZUk1JTTwo+Lf3-Q@mail.gmail.com> <CAOY-YV=Mfu2at2KzoGNszKSEyUpTHzBdbr-SjyVyE_BJBbw_uw@mail.gmail.com>
In-Reply-To: <CAOY-YV=Mfu2at2KzoGNszKSEyUpTHzBdbr-SjyVyE_BJBbw_uw@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 16 Sep 2020 08:01:11 +0200
Message-ID: <CACT4Y+a0avH73Fc-391Ft=XB240wxYA4HokgXZPWoejMk0C=ig@mail.gmail.com>
Subject: Re: Question regarding marking bugs as "invalid"
To:     Himadri Pandya <himadrispandya@gmail.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        syzkaller <syzkaller@googlegroups.com>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Greg KH <gregkh@linuxfoundation.org>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Sep 15, 2020 at 4:15 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> > On Tue, Sep 15, 2020 at 3:23 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> > > > > > Hi,
> > > > > >
> > > > > > Is it correct to mark bugs as "invalid" if they have reproducers but
> > > > > > the reproducer doesn't trigger any issue on testing current status? If
> > > > > > not, then what should be done about such bugs?
> > > > > >
> > > > > > Thanks & Regards,
> > > > > > Himadri
> > > > > >
> > > > >
> > > > > Himadri,
> > > > >
> > > > > if possible try to determine which commit fixed the issue the
> > > > > reproducer triggered.
> > > > >
> > > > > You can potentially bisect with the reproducer on the git history or
> > > > > you can simply look in the git log of the affected files if someone
> > > > > mentioned fixing something related to the trigger.
> > > > >
> > > > > That helps to make sure we do not just close reproducers that just
> > > > > need a lot of time, configuration or luck to hit a certain crash.
> > > >
> > > >
> > > > Hi Himadri,
> > > >
> > > > Basically what Lukas said.
> > > > Bulk closing all of them as "invalid" would be bad for several
> > > > reasons. Either do some reasonable amount of degging, or wait for
> > > > syzbot fix bisection, maybe it will shed some light. It should happen
> > > > after 30 days since last crash IIRC. Also all testing requests/results
> > > > are shown on the dashboard, so this bit of information is not lost.
> > >
> > > Understood.
> > >
> > > I incorrectly assumed(before posting this question) that I should mark
> > > such bugs as invalid and sent the command to syzbot for one such bug.
> > > Now I understand that it was not the right thing. It doesn't show on
> > > the dashboard and I don't know how to undo it :(.
> > >
> > > Bug's dashboard link -
> > > https://syzkaller.appspot.com/bug?id=4c7fd5b46451d957a3d8188f393f1982f9753fe7
> >
> > Hi Himadri,
> >
> > Transitions to terminal states are not undo-able. Consider the same
> > bug is rediscovered concurrently with one undoing "#syz invalid". Now
> > we have 2 versions of the same bug and it will be an incomprehensible
> > mess.
> >
>
> Understood. My sincerest apologies for being naive.
>
> My assumption was that commands like "invalid" are similar to the
> action of submitting a patch, it would generate some discussion about
> the bug and if it is really invalid, someone with authority(like
> maintainers) would actually go and mark it as "invalid". I was clearly
> mistaken. But if we don't have any gatekeeping on such commands and
> anyone can directly change the status of the bug by merely sending an
> email to syzbot, isn't it a security issue?

+workflows

What you are saying is all true. There is no authorization and anybody
can close any bug.

That's the process we could combine from parts we had. Implementing
proper support with users/permissions/assignees would require:
1. Implementing support in syzbot
2. Implementing and deploying some form of user identity and
authorization for kernel developers (emails is not a trusted media on
its own)
3. Finding responsible maintainers for all parts of the kernel and
making them do this additional work

All of these are problematic on different fronts. (2) can be replaced
with use of Bugzilla, but it does not seem to make the problem easier
overall. So so far we have the process we have.
