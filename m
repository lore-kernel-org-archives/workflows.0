Return-Path: <SRS0=kvgU=YR=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2029C47E49
	for <workflows@archiver.kernel.org>; Thu, 24 Oct 2019 14:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A97721D71
	for <workflows@archiver.kernel.org>; Thu, 24 Oct 2019 14:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A/4WuK/m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502781AbfJXOM2 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 24 Oct 2019 10:12:28 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:39920 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502736AbfJXOM2 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 24 Oct 2019 10:12:28 -0400
Received: by mail-qk1-f195.google.com with SMTP id 4so23529527qki.6
        for <workflows@vger.kernel.org>; Thu, 24 Oct 2019 07:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z7pWAuvjtHyiNCHlOLhzzfD5RcM3OZfqNs6uUta5+Oc=;
        b=A/4WuK/mlkEptzaZ6W+iL1r4i330qQoPWklalWpEbipRqo+nUtwLM/v+3We+dERvIx
         tcDAe5PL7KcUb2WrJit9Fz69+uDrTy7oo3JfqMoO0oCx6kozGejJMHVcI7+mAmy7y57q
         VrEKjXF19Z/9JsPUYpJgGyk6yku2MV5mlDdLpdVcGV2/Gmch+03VyMq21RhdIOteRM6X
         LKw4Y5L7P9pkKvHnrRqgWKFxSWPOLS9IeJ0r3td81c3aC/XGeivIHw3vFswyRwB62hX2
         AFfG1FD/nU3v/e3A/i52tdanTH8Eb8z1um5sjvcUxMJ4HpnYUrFmoXjTwYz9nsN/pzMS
         rPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z7pWAuvjtHyiNCHlOLhzzfD5RcM3OZfqNs6uUta5+Oc=;
        b=mN82xPUSQZH/14cZMiYye29Uu4a1MmbM03Brf6LlN+J0zv/g8ThPM5qpJgECYCQEr4
         U5nA7Mo+8q7OqU8/aw3raIUQOv3MNE8u0gKDBDV+kxqGOjS6Qa1OUAPuOz191DKtQ3qS
         rYkxzlLEjKkYaptNc5tTaNo1PfHeXZMTN+T66tAVOxwo04f3cisapb0b590y8hBZq48l
         Oazl3KubSjKgn9TqJDOO4McshqwoNkczyxT++w1antjjGuLW3SU0bqxXoc9CaP9gAAFC
         Xou+BrK34H+1MVaUtN7MtaSlNkv6uVC/vjsq8F5/h6R1ZlRZRIqt2J0g0QrNWJrxm7K5
         avoA==
X-Gm-Message-State: APjAAAXBGcLagUreDCKHGF3hrkbJDAZToHF+h/+RdveYoD+5NM642f6L
        pa//FR+8hXD8MI2v6/FLCK34hZNBEKDuy3H49Fokkw==
X-Google-Smtp-Source: APXvYqzQWMh+r9fbb0gdEWqQ/EYrokWOj2tLF2+mq/zdj4C9zsZ6GJAd4gDiweDlSdBi/5p+9fiHT9vyZ8BK17jjTB8=
X-Received: by 2002:a37:4a87:: with SMTP id x129mr2756166qka.43.1571926345394;
 Thu, 24 Oct 2019 07:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <20191014205658.GG5564@mit.edu> <20191015083741.1d0731e5@gandalf.local.home>
 <20191015163704.GJ4875@pendragon.ideasonboard.com> <20191015124749.1a11926f@gandalf.local.home>
 <20191021153918.GE4947@pendragon.ideasonboard.com> <20191024091541.10af3417@gandalf.local.home>
 <CACT4Y+am=FxEkMYFz8JZXP8GUOEzOPF=6h_s_04HbozU6BJkVQ@mail.gmail.com> <20191024095839.44429eeb@gandalf.local.home>
In-Reply-To: <20191024095839.44429eeb@gandalf.local.home>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 24 Oct 2019 16:12:12 +0200
Message-ID: <CACT4Y+aCq+AVeCtJM8BbppQQ4ePu2OXmAL1Unda_=ER9sd4yeg@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 24, 2019 at 3:58 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Thu, 24 Oct 2019 15:33:04 +0200
> Dmitry Vyukov <dvyukov@google.com> wrote:
>
> > On Thu, Oct 24, 2019 at 3:15 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > >
> > > On Mon, 21 Oct 2019 18:39:18 +0300
> > > Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Purely theoretically let's consider that the changes do not improve
> > _your_ efficiency, but they significantly improve overall project
> > efficiency by positively affecting people who did not develop a
> > workflow over the past decades (maybe there were not around 2 decades
> > ago) and positively affecting various tooling that _you_ may be
> > directly interested in, but otherwise they are important for the
> > project overall. So for you it's no change in efficiency except that
> > you now need to do things differently. What do you think about such
> > changes? Are you ready to force yourself? :)
> > I think it's quite cornerstone question here. All (?) major figures in
> > the kernel (who are ~~98% of decision making, but ~~2% of kernel
> > developers overall) have developed workflows over the past decades
> > that work reasonably well for them. If they veto all proposed changes
> > based on the criteria you described, every new contributor will need
> > decades to develop own workflows to become an efficient contributor
> > and lots of tooling will be painfully hard to do.
> >
>
> The above sound like a one size fits all approach, which I would caste
> a veto to. I would like a solution that works for multiple workflows.
> One where mine and others still work too.
>
> Please, lets work on a infrastructure that is robust and flexible, that
> is split into back and front ends. That way, we have a single "back
> end" and multiple front ends that suite everyone's needs.
>
> -- Steve

I agree that the system must not lock in into a single UI.
However, (1) somebody will still need to glue all old frontends with
the new backend. (2) some workflows may still break regardless of a
perfect backend/frontend split. Consider, previously one could say in
arbitrary plain English that a bug X is fixed by commit Y, but if we
want to build anything on top of that can't be plain English anymore
and will require changes in workflows.

FWIW, Gerrit satisfies most of the criteria. It provides a nicely
formatted database that you can easily git fetch and take with you
offline. In this sense it is a robust and flexible backend. However,
one won't get all of hundreds of existing scripts and systems work on
top of it out-of-the-box.
