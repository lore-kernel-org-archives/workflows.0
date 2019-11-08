Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E176BFC6194
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 11:00:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B840521924
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 11:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731570AbfKHLAT (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 06:00:19 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:46579 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727459AbfKHLAT (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 06:00:19 -0500
Received: from 79.184.254.83.ipv4.supernova.orange.pl (79.184.254.83) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id d6e088ee1f1f0a18; Fri, 8 Nov 2019 12:00:17 +0100
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Han-Wen Nienhuys <hanwen@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Subject: Re: RFC: using supersedes: trailer to indicate patch/series revision flow
Date:   Fri, 08 Nov 2019 12:00:16 +0100
Message-ID: <8377829.SsT3G3NtT2@kreacher>
In-Reply-To: <CAMuHMdXrPKUf5sJhw8s-NYCGpwDoLGOptN=poaCJb5dWDNkVaw@mail.gmail.com>
References: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local> <CAFQ2z_PCYbY_vBnbjVrVijMteG5iRYHSUswe3Vo8Jp-OFBxZAQ@mail.gmail.com> <CAMuHMdXrPKUf5sJhw8s-NYCGpwDoLGOptN=poaCJb5dWDNkVaw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Friday, November 8, 2019 10:59:55 AM CET Geert Uytterhoeven wrote:
> Hi Han-Wen,
> 
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
>   - shrink (some patches rejected, or already applied independently),
>   - be split in multiple series,
>   - dropped but some parts reused in other series (possibly by someone
>     else),
>   - ...
> That's the hard work in patch tracking.
> 
> So series IDs do not cope well with this, and "superseded" really should
> apply to individual patches, not series, too.

Right.



