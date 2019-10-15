Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B30C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 13:14:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C2B621848
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 13:14:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZUotmqWD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731557AbfJONOe (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 09:14:34 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44166 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729551AbfJONOd (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 09:14:33 -0400
Received: by mail-vs1-f67.google.com with SMTP id w195so13073005vsw.11
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=L3Ul52u5RjlWHTTTKDtCH/saS1SBvU7CV8y0jV6O8OI=;
        b=ZUotmqWDcA5cgy29SQ6uLSrpAU9zeKsSYBFY7utYLEjxulljHgKpaWprhDU09ByMZT
         /aPw4gKEJvtxhMft1wE9yH5pRGwTSqO4j+UAS2Sd1hZj1HFcIxXeb/lamfwODgmR2SCW
         Y5uIR03GyfakFrQhqWteVVz/6ZmWHLSUlKcfEcSVP7ua4gNNtrAu4gnajIiGuw7XPHeP
         Trak3zPPSGp4b81jA/SKeqO2xsWROOpwOVstPmg71nIoIlYSkr7Zg8NdowAUDVq66H9g
         aBvJiIh6BPnkwXjmkie/I6UWhFasvLysl2u7SPZ4Y5/btBIRAEC7RBa8VbVzSL6ri55b
         6Oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=L3Ul52u5RjlWHTTTKDtCH/saS1SBvU7CV8y0jV6O8OI=;
        b=hfgao0NhmoeDYm5kzVIIpGUi84E7V8O8C8I/9zjEdOJs7sMjz4ho8YCy0lZBOYq+zl
         RrIjDiXlbLS/Fc5dWMB/xVe9XVidXKYFPQWGGhkGm5cXI4JjvKtBulOGUObKHXuY8rHW
         85fDXCTozZOgFOp60ytR9Zj/7G1xPamUGtkPvqq3gfS9mRtyO9S7dNX9cyk+PdkX5u5o
         GdvoZpi0z8PY9GZxjkI7sYD+LbyExJ27vu8Apf3YcPjEM9yg3XwDDT56EGhgYNDQOcCC
         ldFmRk1Do7SORmbKx3I3TPzg84Ea3tuFPz4UxWHQaeGMGPIigOucWaD05iUMD88ONvSv
         a8kg==
X-Gm-Message-State: APjAAAUulkJQnvVYgrNllGNknrgMhdI7j5ltQAL4LJSscQ5H0xHgovk5
        3vSwWkV+aMRT0r8KSKUEzCvved3Dff0Tp0OOCwpHQw==
X-Google-Smtp-Source: APXvYqyuYZhbdUORRruYXfqan7ZkOalSbzmlJTPr7AiXI99xTVv7CC4kUfWdrxY5ffk94FJTB2+g1dDpmz8SeoVFVJg=
X-Received: by 2002:a67:e44d:: with SMTP id n13mr19890609vsm.46.1571145272406;
 Tue, 15 Oct 2019 06:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191007211704.6b555bb1@oasis.local.home> <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home> <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local> <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local> <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu> <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015015425.GA26853@mit.edu> <CAKMK7uGtvqFSw+wOBeGjV88DeyUoMTV3+F4Fpqv6NGUBCkAAgA@mail.gmail.com>
In-Reply-To: <CAKMK7uGtvqFSw+wOBeGjV88DeyUoMTV3+F4Fpqv6NGUBCkAAgA@mail.gmail.com>
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Tue, 15 Oct 2019 15:14:18 +0200
Message-ID: <CAFQ2z_Pxc=0LjEieUC7Dz_sQiUKBr2oKUVrW7Fppj5AQbD_W5A@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 2:00 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > Today, this can be easily done by cc'ing the patch to multiple mailing
> > lists.  Exactly how this works may get tricky, especially in the
> > federated model where (for example) perhaps the btrfs tree might be
> > administered by Facebook, while the xfs tree might be administrated by
> > Red Hat.  Given that we *also* have to support people who want to keep
> > using e-mail during the transition period, it may be that using
> > unauthenticated e-mail messages where comments are attached quoted
> > patch hunks, perhaps that can be the interchange format between
> > different servers that aren't under a common administrative domain.
>
> Last time I looked none of the common web ui tools (gerrit, gitlab,
> github) had any reasonable support for topic branches/patch series
> that target multiple different branches/repositories. They all assume
> that a submission gets merged into one branch only and that's it. You
> can of course submit the same stuff for inclusion into multiple
> places, but that gives you separate discussion tracking for each one
> (at least with the merge/pull request model, maybe gerrit is better
> here), which is real bad.

Can you say a little more about what you expect when working with
multiple branches/repos?

In gerrit, you can assign freeform tags ("topics") to changes, to
group them. See eg.

  https://gerrit-review.googlesource.com/q/topic:"rename-reviewdb-package"+=
(status:open%20OR%20status:merged)

this will let you group changes, that can be in different repos and/or
different branches. See also
https://gerrit-review.googlesource.com/Documentation/intro-user.html#topics

Discussions are tied to a single commit, but you can easily navigate
between different changes in topics, and submission is synchronized
(submitting one change will submit all of the topic. it's
unfortunately not atomic).

This is how submissions to Android work, as Android is stitched
together from ~1000 repos. It is likely that this support will further
improve, as Android is one of our biggest internal key customers.

--=20
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--
Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
