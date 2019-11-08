Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D97C5DF60
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 10:49:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DCBD218AE
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 10:49:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EcyAjKtj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbfKHKtC (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 05:49:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47382 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfKHKtC (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 05:49:02 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3088A33E;
        Fri,  8 Nov 2019 11:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573210140;
        bh=Tegk0X+/Ssi67NOQKheFCd2J7M5LJi9UdODZwWPZyXg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EcyAjKtjxhlG5lq5cdBw1hx/W7dLiwxew6oJqiotnfa5G4p9u82M+L5UGWRjtZvtw
         6subV94+MRNfHSWqw1HsgxBgWQ79kLTORlZRbau3eSO6DIm+PoIyRbfU43Po41FzvP
         ir/w0bFZdIHBWksYWfM8kNQqGqJhTxvi7eMLwaEM=
Date:   Fri, 8 Nov 2019 12:48:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Han-Wen Nienhuys <hanwen@google.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Subject: Re: RFC: using supersedes: trailer to indicate patch/series revision
 flow
Message-ID: <20191108104850.GA4866@pendragon.ideasonboard.com>
References: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local>
 <1779121.stEDml5jbt@kreacher>
 <CAFQ2z_PCYbY_vBnbjVrVijMteG5iRYHSUswe3Vo8Jp-OFBxZAQ@mail.gmail.com>
 <CAMuHMdXrPKUf5sJhw8s-NYCGpwDoLGOptN=poaCJb5dWDNkVaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXrPKUf5sJhw8s-NYCGpwDoLGOptN=poaCJb5dWDNkVaw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Geert,

On Fri, Nov 08, 2019 at 10:59:55AM +0100, Geert Uytterhoeven wrote:
> On Fri, Nov 8, 2019 at 9:31 AM Han-Wen Nienhuys <hanwen@google.com> wrote:
> > On Fri, Nov 8, 2019 at 12:45 AM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> > > > 2. Should supersedes: link to the previous version of the patch, or the
> > > >     first ever version of the patch? I am leaning towards the latter,
> > >
> > > And then how do you know that version 2 was superseded by version 3?
> >
> > You throw the message ID into a search engine, and see what it returns.
> >
> > The advantage of keeping the patch series ID stable is that you can
> > consider a patchseries as a document and then easily index it inside a
> > service (say, patchwork) using Lucene, ElasticSearch or some other
> > common technology.
> >
> > If you make the "supersedes" refer to specific versions, a workflow
> > service will be more susceptible to errors if messages were lost, and
> > the service has to work harder to aggregate the different versions of
> > a patchseries together.
> >
> > Is it common for different authors to superseed each other's patch
> > series? If yes, "superseeds: precise version" is more precise, if not,
> > you get the same information from the timestamp of the cover letter.
> 
> All/most of the above applies only to versioning of patch series that
> implement a fixed feature, with a fixed scope.
> So Vn+1 is really an improved version of Vn, and nothing more or less.
> 
> But this does not apply to many patch series in Linux kernel development.
> Patch series may
>   - grow (more patches added),

This shouldn't be a problem, as the new patches get posted for the first
time, and thus don't supersede anything else than what the previous
version of the series contained.

>   - shrink (some patches rejected, or already applied independently),

This should also not be an issue, as the patches that are dropped or
that are already applied will not be resubmitted separately.

>   - be split in multiple series,
>   - dropped but some parts reused in other series (possibly by someone
>     else),
>   - ...

These are the difficult cases :-(

> That's the hard work in patch tracking.
> 
> So series IDs do not cope well with this, and "superseded" really should
> apply to individual patches, not series, too.

-- 
Regards,

Laurent Pinchart
