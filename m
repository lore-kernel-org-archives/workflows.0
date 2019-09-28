Return-Path: <SRS0=479y=XX=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA6DC4360C
	for <workflows@archiver.kernel.org>; Sat, 28 Sep 2019 22:16:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C10AF208E4
	for <workflows@archiver.kernel.org>; Sat, 28 Sep 2019 22:16:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbfI1WQS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 28 Sep 2019 18:16:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:56668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728742AbfI1WQS (ORCPT <rfc822;workflows@vger.kernel.org>);
        Sat, 28 Sep 2019 18:16:18 -0400
Received: from oasis.local.home (unknown [12.174.139.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E78B1206BB;
        Sat, 28 Sep 2019 22:16:16 +0000 (UTC)
Date:   Sat, 28 Sep 2019 18:16:15 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Message-ID: <20190928181615.581ea87d@oasis.local.home>
In-Reply-To: <CAMuHMdUySTyRmuCrCbW61LYbsF_5Jvd7P=mhjGSB0oR2Ec+b3Q@mail.gmail.com>
References: <1811089.yxvLMk49Ug@kreacher>
        <20190923162001.GD6005@mit.edu>
        <CAMuHMdX31h-VEf0bCjdTTLSO8xwMdE1cR9GsQ2tEk4PSHOPctA@mail.gmail.com>
        <575CE8BF-4C3A-4AEB-8749-9D2B92FCD4D3@goodmis.org>
        <CAMuHMdUySTyRmuCrCbW61LYbsF_5Jvd7P=mhjGSB0oR2Ec+b3Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 26 Sep 2019 15:39:54 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> On Thu, Sep 26, 2019 at 3:02 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > That would be wonderful.  
> 
> Oh, the irony ;-)
> 

Sorry, I couldn't resist ;-)

-- Steve

> > -- Steve
> >
> > On September 26, 2019 12:18:18 PM GMT+02:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:  
> 
> [...]
> 
> > >And if it's done right, it may solve (or make it harder to show) other
> > >bad review
> > >behavior, like:
> > >  - Top posting review comments,
> > >- Quoting a 2000-line patch when commenting on a single line deep down.  
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

