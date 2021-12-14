Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25DBC4332F
	for <workflows@archiver.kernel.org>; Tue, 14 Dec 2021 16:31:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbhLNQbv (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 14 Dec 2021 11:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbhLNQbu (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 14 Dec 2021 11:31:50 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACC5C06173E
        for <workflows@vger.kernel.org>; Tue, 14 Dec 2021 08:31:50 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id o1so35820538uap.4
        for <workflows@vger.kernel.org>; Tue, 14 Dec 2021 08:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=edcivjuCkPA8peNPXGIq4/q3r1t+/KvBVN93D+BO1Xc=;
        b=iUcB7VILKkPEHWZ2sh7swMJl6Otu/LYrTsJ7uOcUfsnRKivi0qvjttnOMgqS6GdFic
         jrlnBDX5xW1geYU7ohR3qfI8t/Cj0T75wsGbk3WkrOzUZClpXKN+5jVi+gcRGjxIB/OM
         zEImtZtXL+lY0dzMXYc1hWSjc9EJqQlDgP9bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=edcivjuCkPA8peNPXGIq4/q3r1t+/KvBVN93D+BO1Xc=;
        b=1gSu27CbQ/W6rP5IKhQ3UFjOvI96MEs03r1iiURtiKUgk9hfy1eeHCUcflvUAQzCKO
         CZIGDjSN0PJCxKBzDb71Nsq7hZ3runCcVciNaoUejTrZnXULZQCOT1t5j5buFk8rEJLN
         VOqI0i/g/4mojbO6CdKvRZPX1neoBm/I0ScGgbV0pDy5Y2FFNkBSryAWK3aydP0LMqAe
         D8FHrPVAhvamIALekhtS4oWaI9ytEraddcq6GMJn2tWEYj27OAWLTsavI1zvVJDI0oKi
         ffcDcfGUD2nowENh/rLwkiB+ZmgySW/05d3o4fFpXgzLIIC82zZevo6bzutdB0zYphGO
         aurA==
X-Gm-Message-State: AOAM532MTw/ca3d6WX2xAPbb6qaiawaXIdOUcFFcFdb6RreKf2FEDyXT
        aXEo6IYSfIN60c6TBBoOzp7lxuNRMP+EaS35N5kIMgdaJ27b7w==
X-Google-Smtp-Source: ABdhPJyIjLjaAbMPbJ1VzPubEY9ihfSjdPdw+cgNoXOWDseBXlffSmyq+nsy0Kgbrt32SUjVZ5Kd8qK0kHKcjAvF32A=
X-Received: by 2002:ab0:2983:: with SMTP id u3mr6397036uap.35.1639499509087;
 Tue, 14 Dec 2021 08:31:49 -0800 (PST)
MIME-Version: 1.0
References: <87mtl7ufl3.fsf@toke.dk> <CAPnjgZ1THJQSUj2Mmq2P6EtJXZQV=th0vnN2cLZ=BZe_sck+SA@mail.gmail.com>
 <1919dc6e-66b7-4179-7991-cbae44215c1f@infradead.org>
In-Reply-To: <1919dc6e-66b7-4179-7991-cbae44215c1f@infradead.org>
From:   Simon Glass <sjg@chromium.org>
Date:   Tue, 14 Dec 2021 09:31:37 -0700
Message-ID: <CAPnjgZ0t6TyUM4YYeSiVB3CQKzCq3k+5LZn7R26Oi9WwCxmX=A@mail.gmail.com>
Subject: Re: Monitoring the status of your own patches on patchwork?
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Randy,

On Mon, 13 Dec 2021 at 19:12, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 12/13/21 10:37, Simon Glass wrote:
> > Hi,
> >
> > On Sat, 11 Dec 2021 at 12:06, Toke H=C3=B8iland-J=C3=B8rgensen <toke@re=
dhat.com> wrote:
> >>
> >> Hi everyone!
> >>
> >> I was wondering if anyone had any nifty tricks or utilities to help
> >> monitor the status of your own patch submissions on a patchwork
> >> instance? Things like getting a notification when a patch changes stat=
us
> >> or when one of the automated checks on that particular patchwork
> >> instance fails for a patch you submitted?
> >>
> >> I can just filter the patchwork web interface to my name, of course, b=
ut
> >> I would like something that can be automated so I can make the stuff I
> >> care about show up in my inbox :)
> >
> > I'll just mention 'patman status' here, which collects tags from
> > patchwork so you can send them with the next version. It also shows
> > you code-review snippets on the cmdline which I find much faster to
> > process, particularly for large patches. See below, although it's a
> > bit hard to read without the colours that patman uses.
> >
> > I would like something that can track all the series and tell me what
> > is outstanding. At the moment I keep a manual list but often forget
> > things.
>
> Hi,
> Where is this 'patman' found, please?
>
> I see   https://source.denx.de/u-boot/custodians/u-boot-dm/-/tree/patman-=
working
> and   https://github.com/siemens/u-boot/tree/master/tools/patman
> (the latter one seems to be untouched recently).
>
> Is there another URL or is the denx.de URL the one to use?

You can use Denx but I suggest github:

https://github.com/u-boot/u-boot

I should figure out how to get patman into pip.

Regards,
Simon
