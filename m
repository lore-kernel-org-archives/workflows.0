Return-Path: <SRS0=6D5N=3F=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CFFC33CAF
	for <workflows@archiver.kernel.org>; Thu, 16 Jan 2020 19:35:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1DA42072B
	for <workflows@archiver.kernel.org>; Thu, 16 Jan 2020 19:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DayTvVfi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbgAPTf1 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 16 Jan 2020 14:35:27 -0500
Received: from mail-io1-f43.google.com ([209.85.166.43]:32973 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729010AbgAPTf1 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 16 Jan 2020 14:35:27 -0500
Received: by mail-io1-f43.google.com with SMTP id z8so23254837ioh.0
        for <workflows@vger.kernel.org>; Thu, 16 Jan 2020 11:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iSl+nhcLozPUpiRtJybAOly6DFhJi90SNDWAOu3qgq4=;
        b=DayTvVfiUq1opIJLYmJZHfLihFW/qBe7Q8/YzWBJe4an2zUoD/4dLpkEY5Pn1wcCSX
         EXpxqvZb7mdsAOie2LwMWrXtlxKlZF0QENJzMySwhlvEmlFhohAMwNxYgYGjlKoJ8PJk
         WajY2ERDlKQ2478Gr4yGn2ESwAuVkg4n+oIT0IuPen69N5v4TQtjWoEZaukA/axTw0Na
         Hl+hPqXNGodVsTPS2qntJ7x5SbXU+n2wh1dPN6hJOfWHpZT+h0mgb89Nu+wPcHB47iwI
         fA7ZkuXZGMfhFex6AnIMz+BvHzOdG9fpvBxGOF3eYzqptDr4WunmzYEmCApVD9ykkdVw
         ncjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iSl+nhcLozPUpiRtJybAOly6DFhJi90SNDWAOu3qgq4=;
        b=EHqtWyB4cH8QPgOmW376KExQNK2T7R5Q2P58QF9sX2EQ6adUIu6l8+St+KL+yRE6TD
         jlvnQcrfBfSs1VNlbESbYf0GaI8cw0/9K1DcPeDFkaUqFg18JWb4rfre4bBlvhiy9Out
         64VkX9tWI5T8aGnwzZazdyn0h7XUR5uTFKIkZksV0tZPaUjtzWF7ZIcBrWZPzCCOTwtB
         yVM85rKAZy9KhXCYHEzacB298HCHDdMeSig38mOnEGlmXhg8iqcMPr+JTMqDbGrZeAPj
         yvKDIeHJP/0fk79dq5dv2s9PYh2l5VcmyPxl6j5OaePY12M3KVAJA6dd/jvnhL90NvC5
         mTuA==
X-Gm-Message-State: APjAAAWVLYFsa7x1MgIQoVQyHOPx+brprc7vsEijLw+582lzlpM7DWLr
        nhvlOi/YusXNZc75gGLxFcFteRYpBtWzKtWWkVCwsg==
X-Google-Smtp-Source: APXvYqwl4xfLobuYDtM6GcbPCN4ON+anSK+ZNONSHb2tEdnzt538sjeOWPb0Pnh5PTn4YY4qREJJsjpy+14vfzWA4Ow=
X-Received: by 2002:a5e:8703:: with SMTP id y3mr27226560ioj.308.1579203326382;
 Thu, 16 Jan 2020 11:35:26 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMy3_4vBeVS42c4AGYVNHzcP2iO0FxWN6MnncT0uc_ZKKw@mail.gmail.com>
 <CAEG3pNCgLTYrwoeA4_F9Ru-81O1dWWJ9SnnKKcWfr4nG=y2zRw@mail.gmail.com> <877e1skyha.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <877e1skyha.fsf@dja-thinkpad.axtens.net>
From:   Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 16 Jan 2020 11:35:00 -0800
Message-ID: <CAEG3pNAg2yBk5o3qUv6gsbB6hx=nJ4ygohNe4R0CjRvaAha04w@mail.gmail.com>
Subject: Re: Explore ideas on workflows improvements with Google Summer of
 Code mentoring program?
To:     Daniel Axtens <dja@axtens.net>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, workflows@vger.kernel.org,
        Till Kamppeter <till.kamppeter@gmail.com>,
        Aveek Basu <basu.aveek@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jan 15, 2020 at 4:59 PM Daniel Axtens <dja@axtens.net> wrote:
>
> Michael Turquette <mturquette@baylibre.com> writes:
>
> > Hi Lukas,
> >
> > On Tue, Jan 14, 2020 at 11:06 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >>
> >> Dear all,
> >>
> >> Till Kamppeter and Aveek Basu organize the Google Summer of Code
> >> student mentoring program in the name of the Linux Foundation. They
> >> have set up a page for project ideas for the Linux Foundation's
> >> participation in the linuxfoundation wiki:
> >>
> >> https://wiki.linuxfoundation.org/gsoc/google-summer-code-2020
> >>
> >> I believe many ideas discussed here on this list, e.g., extensions to
> >> patchwork, public-inbox, further bots, scripts, etc., are well suited
> >> to be prototyped or implemented by students in the GSoC program.
> >>
> >> If you agree and have some good ideas, please add your ideas to this
> >> currently still empty draft page:
> >>
> >> https://wiki.linuxfoundation.org/gsoc/2020-gsoc-kernel-workflows
> >
> > I added the first entry, "Bidirectionally sync Patchwork patch status
> > with Gmail labels". Stephen Boyd and I use a local solution to
> > coordinate patches in the Linux Clk tree. Our solution requires
> > Patchwork + the Notmuch mail indexer + Gmail/G Suite to work. My
> > proposal is to remove the Notmuch requirements and teach Patchwork to
> > talk directly to Gmail (and vice versa), perhaps via a solution in the
> > cloud, running on a server somewhere, and not dependent on the uptime
> > of my laptop.
>
>
> <pw maintainer hat>
> Let me know if there's anything you need in the REST API for this. We're
> going to cut 2.2 Real Soon Now, which will be your last chance until 3.0
> which, given our general velocity, will not be out until late 2020.

Thanks for the support Daniel. The current solution that I use is
based on the pwclient tool, and I have no idea if that uses the REST
api under the hood or not. If this project gets picked up by students
in GSoC then hopefully they can provide feedback to you on any API
enhancements.

I do have a working setup on gitlab that I can share, but again this
assumes Notmuch is part of the toolchain.

Best,
Mike

>
> Regards,
> Daniel
>
>
> > From my discussions with kernel devs, I believe there is a reasonably
> > sized Venn diagram of people that use both Patchwork for patch
> > tracking as well as Gmail/G Suite for email. Having those two talk
> > might mean that I never have to use the Patchwork web interface again,
> > a big win IMO, and I can just use email.
> >
> > Best regards,
> > Mike
> >
> >>
> >> Ideas should be roughly described in five to six sentences, possibly
> >> with a list of expectations on required knowledge a student should
> >> show for its application. Within the application period later,
> >> interested students have to write a much more extensive project
> >> proposal as part of their application, by exchanging with the group to
> >> refine the rough idea to a proper task and student project.
> >>
> >> Please also take into account that the deadline for the application as
> >> mentoring organization is Feb 5 and after that Google will evaluate
> >> the applications. So have the ideas (at least most of them, ideas can
> >> be posted up to the student application deadline) in by then to raise
> >> chances to get accepted and get slots for students assigned.
> >>
> >> If you have any questions concerning GSoC organisation, you can reach
> >> out to Till, Aveek or me.
> >>
> >> Best regards,
> >>
> >> Lukas
> >
> >
> >
> > --
> > Michael Turquette
> > CEO - Los Angeles, CA
> > BayLibre - At the Heart of Embedded Linux
> > http://baylibre.com/
> > Schedule a meeting: https://calendly.com/mturquette



-- 
Michael Turquette
CEO - Los Angeles, CA
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
Schedule a meeting: https://calendly.com/mturquette
