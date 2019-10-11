Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4ADCECE58C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 11:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8FA8F206CD
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 11:01:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EJjtKoJw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfJKLBS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 07:01:18 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34369 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727243AbfJKLBS (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 07:01:18 -0400
Received: by mail-qt1-f193.google.com with SMTP id 3so13282168qta.1
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 04:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lF1QyFtxuPZ9J9k5ftv/F81iT/9b/LBryGRSZCKsgYs=;
        b=EJjtKoJw2bDaQtl61mTr1hLRF8AyF4IDTUKxSvsY5pKPfR7qoTcScZH5AxuABo9CiY
         WK0RPs2WVcIqj05VlydavtieZfclojZJv2BITIDhxO9JVJvMjpSsXgJFtJGZzloutq8d
         UEqxPdJ+POVj4zKcN97OyuRANgecGby1+VNcbE8REoSikZg5b5JMpHVG3V+TN3RN8Uh7
         0ST6D/v3URpJRUR14Fp5kg2ppvt3qUz/9FPFLagKACinuCPk4E+KSRS+YSlJxHkCqqww
         aiAK7obe3ZGn7g15I7/MgBtZuAMmHU5T6ReTh6KwJ8JYv5CzleQfq0pmLispc2Ua6ybu
         wYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lF1QyFtxuPZ9J9k5ftv/F81iT/9b/LBryGRSZCKsgYs=;
        b=mhbjto5jcp9ADdmtsU620wFNQYKLvMymkCU3VBfJ0blrcZcYyKadAwfWZ3+RaKw1Mv
         hatUbTmWEVyPIkaL8+Jb/YWUbT5vNGdW28d1V91igytzKA2+/6z5qocLlx4olzZAGfOA
         gFx7dUrwNxCHRH0sGseQUkpPdf6s6pGpb7PE7H/BuO09A0dYyP4SfCwDuEbsTTIf63sF
         FjJfo1N2HOkOv10KKlJvsfo/n4qadCjw5UUyQCdAew2v5jeOeL0twZ6xdXY4EGol0nVn
         momRCc/uZUQ6bJaTeBHf39ZHGvEfqHOquvvISoGrG+KwdM/dAjq/OItgdwgP8YePVihC
         XJpA==
X-Gm-Message-State: APjAAAVBq5RN4RpXsXnE7JcdOeevJXk+URKKbXYsaqPxxsFNMBwmgF5l
        YgV23Gd9wMGKyIMhWJnxlZ3UG+ewjdQ+lrPUbyuLPg==
X-Google-Smtp-Source: APXvYqySUwexgRU/RPnBw2Heyv9mQq2Cqk8XeptYgnKTvok12UBRgrPyLJyoUx6+3DLlUv3mSV+wyKWqd+cD/IxNE9k=
X-Received: by 2002:ac8:73c8:: with SMTP id v8mr15939917qtp.158.1570791676449;
 Fri, 11 Oct 2019 04:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net> <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com> <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com> <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com> <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com> <20191010205733.GA16225@mit.edu>
In-Reply-To: <20191010205733.GA16225@mit.edu>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 11 Oct 2019 13:01:04 +0200
Message-ID: <CACT4Y+YcM6U53FpJ6dtjk6CDmW0POVwbyvxJLZx-u+NZOgM_aw@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 10, 2019 at 10:58 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
> On Thu, Oct 10, 2019 at 07:52:50PM +0200, Dmitry Vyukov wrote:
> > I know you all love Gerrit but just to clarify :)
> > Gerrit stores all metadata in a git repo, all users can have a replica
> > and you can always have, say, a "backup" replica on a side done
> > automatically. Patches and versions of the patches are committed into
> > git into special branches (e.g. change/XXX/version/YYY), comments and
> > metadata are in a pretty straightforward json (this is comment text
> > for line X, etc) also committed into git, so one can always read that
> > in and transform into any other format. And you can also run Gerrit
> > locally over your replica.
>
> Konstantin has spoken about some his concerns about git's scalability,
> and it's important to remember that just because Gerrit has shown to
> work well on some very large repositories, it doesn't necessarily mean
> that it will work well on git repositories using the open source C
> implementation of git.
>
> That's because Gerrit as used by Google (and made available in various
> public-facing Gerrit servers) uses a Git-on-Borg implementation[1],
> where the storage is done using Google's internal storage
> infrastructure.  This is implemented on top of Jgit (which is git
> implemented in Java)[2].
>
> [1] https://groups.google.com/a/chromium.org/forum/#!topic/chromium-dev/xM9THFr55L8
> [2] https://groups.google.com/a/chromium.org/d/msg/blink-dev/GZOeMUPE7Bc/LmxSj_ezcQ8J
>
> That doesn't necessarily mean that git can't be made to work well
> enough as a transport layer.  I'm just pointing out this may be the
> explanation for why some say, "See, Gerrit works really well on
> super-large repos storing huge numbers of review comments" and others
> are saying, "it would be really scary to run git as a transport layer
> on kernel.org servers because git won't scale well to that kind of
> load."
>
> Both may be correct.
>
> Cheers,
>
>                                         - Ted

Good point. I wonder if it's possible to choose a more-git-friendly
storage scheme and to optimize the OSS git to get to the necessary
scalability level. I am asking because "optimizing some piece of
software" looks like a smaller part in the grand scheme of things of
the overall problem (unless of course there are some fundamental
conflicts between git and efficient storage for this type of data).

However, I mainly wanted to point out a higher-level consideration.
Total doomsday resistance, assuming every party in the world is an
adversary and total decentralization are nice properties, but each of
them makes project design and implementation an order or magnitude
harder. So the question is: are the following requirements would be
enough:
 - open-source implementation
 - transparent raw data format
 - ability to export and backup all data natively (each user may even
have a complete replica of whole raw data for the "local patchwork"
thing)
 - ability to do most of the work locally
 - not owning user identities/be able to export user identities
 - maybe something else, but you get the idea
?

We already have patchwork and public inbox deployed on kernel.org, so
could this whole development support system also be something simply
deployed on kernel.org? That would make lots of things _much_ easier.
