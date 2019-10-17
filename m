Return-Path: <SRS0=PtRO=YK=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5A6ECE58E
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 12:53:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF95A20854
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 12:53:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="jOTyW6sp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbfJQMxt (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Oct 2019 08:53:49 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:37821 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbfJQMxt (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Oct 2019 08:53:49 -0400
Received: by mail-ot1-f48.google.com with SMTP id k32so1777519otc.4
        for <workflows@vger.kernel.org>; Thu, 17 Oct 2019 05:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GR9N1fo7+UP0bD0Fc89H5CBj6WEt3uX/MGZAGbXWW34=;
        b=jOTyW6sp7j/Q0+pGJzebq1Jj6bMPQuH9cLauP3NKRLJ5badImycqF8Az9YdqkCq0Y8
         ZYTyCniOUpoNDy0mvJSRURZEgpZcsrT6iES6tSd4seCuQTKOMYIufWVKxqiy3pnSp5Q7
         KIyNYNFZG9HxUYZGRfJ8wbUIfAAUcG0/hi7bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GR9N1fo7+UP0bD0Fc89H5CBj6WEt3uX/MGZAGbXWW34=;
        b=dPqW8gx5Izw/6q8+hFVCWzVMjgp/VDxhNu4mEO0x8uibUwPl/JAwhs+oZxi4fs9DKd
         U3cAPAfTTCc+Le61x3Lps/brW3Rv/DRmvuEmNUAb59dntCTr2jFnpjYUjZqM6xWLYWtR
         hQM8OEpHIG1pPASTQjQ7yG7cCpGzqRkLU76FO3mrFzJtn5yow5WyS2dJRE4yp+pGX7Kk
         aJnLlSZMbYXveHkhZVM6ayDPg5Uyq1LuifcU4CMW0IJ4qb6O42p9pz7w2tH2a+1Z3R7E
         Td6xu1s7qU5GYSplLe7R31kbgb7uFm8RmELpkdql8P5KuRPNFI8V3A4IJqGHaasNq/xr
         BFeg==
X-Gm-Message-State: APjAAAVkQe/Ol/eiD4x69FEl99R6wkbZSea1Ymk306jt0999T0v9UELL
        ddv2eZQl4Lr20gFoEsdEkvE8EOY0cjjWGU6B/3WNC6A8
X-Google-Smtp-Source: APXvYqx2hrPImoioTasZswLKjV6U/mUJM+N1DjB0MHdJPZAziNBvbMKxXwaqOtefWn2F1uOx7ULqLSj5gahWy88VxWw=
X-Received: by 2002:a9d:6b0a:: with SMTP id g10mr2894097otp.303.1571316828054;
 Thu, 17 Oct 2019 05:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191007211704.6b555bb1@oasis.local.home> <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home> <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local> <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local> <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu> <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015015425.GA26853@mit.edu> <CAKMK7uGtvqFSw+wOBeGjV88DeyUoMTV3+F4Fpqv6NGUBCkAAgA@mail.gmail.com>
 <CAFQ2z_Pxc=0LjEieUC7Dz_sQiUKBr2oKUVrW7Fppj5AQbD_W5A@mail.gmail.com>
 <CAKMK7uGseMAmmLkawkaMMJgK=XAXoK+vOP8Uo9obXpss_v+WYQ@mail.gmail.com>
 <CAFQ2z_OVwS0Ups1QCEvJBFTsZmsw1u25bJh+a3xArjhXggLqcA@mail.gmail.com>
 <CAKMK7uHvcc4WvswnWMaiT+B7NV==DWB5MGj4KSkOMSukE+4=OA@mail.gmail.com> <CAFQ2z_NdqD5oj6QLqFD+E_KnW7E9cJKdMhQCe5CQ4qsOjR3PPQ@mail.gmail.com>
In-Reply-To: <CAFQ2z_NdqD5oj6QLqFD+E_KnW7E9cJKdMhQCe5CQ4qsOjR3PPQ@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 17 Oct 2019 14:53:36 +0200
Message-ID: <CAKMK7uGa4ZfnsAgCJjhU1RkLspU2boX5pFxGoXz608jJc=iqQQ@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Han-Wen Nienhuys <hanwen@google.com>
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
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 17, 2019 at 2:10 PM Han-Wen Nienhuys <hanwen@google.com> wrote:
> On Thu, Oct 17, 2019 at 1:50 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > I'm not saying you're having no reasons to do this. All I'm saying is
> > that outside of the kernel, there's not really anyone doing it like
> > the kernel, mostly because the popular tools just don't really support
> > this workflow.
>
> Fair enough. This has been a hugely elucidating discussing; thanks for that.
>
> I had some thoughts about something that resembles what I think you
> are looking for. I wrote them down here
>
> https://docs.google.com/document/d/15OzXgmZ_yQ7UHnMUeiK3AB4tgQauJde4pzStCv-mIYM/edit#
>
> I think this could be made to work, but it would be a considerable effort.

Scrolled through it, seems like a good summary of a lot of the things
discussed here. Where I'd disagree is on the categorical rejection of
existing solutions like gerrit/gitlab, but what's clear is that
existing solutions all have gaps somewhere. I also think that no tool
will reach full (or even wide) usage across the entire kernel, that's
not realistic. I mean kernel started this entire git thing, and
there's still kernel subsystems and maintainers using something else.
Personally I think trying to fill the gaps in existing tooling will be
more successful, and that's still the plan for running some
experiments in the gpu subsystem (just these days we finally gotten
around to move our issue tracking over to gitlab from bugzilla, as one
of the steps to have something better integrated).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
