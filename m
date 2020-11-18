Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3657C56202
	for <workflows@archiver.kernel.org>; Wed, 18 Nov 2020 19:54:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2605246BC
	for <workflows@archiver.kernel.org>; Wed, 18 Nov 2020 19:54:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgKRTyI (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 18 Nov 2020 14:54:08 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:51051 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725710AbgKRTyI (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 18 Nov 2020 14:54:08 -0500
Received: from callcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 0AIJrdnU020080
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Nov 2020 14:53:39 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id DE69A420107; Wed, 18 Nov 2020 14:53:38 -0500 (EST)
Date:   Wed, 18 Nov 2020 14:53:38 -0500
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Evan Rudford <zocker76@gmail.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>, workflows@vger.kernel.org
Subject: Re: Is the Linux kernel underfunded? Lack of quality and security?
Message-ID: <20201118195338.GD538542@mit.edu>
References: <CAE90CG5h0RqNs8N7qbZzajYK9A3eY0LWHqLfzX7Z-v-aef4R2g@mail.gmail.com>
 <20200105081550.GB1667342@kroah.com>
 <CAE90CG5MQM+8qX0F_RHmHwrh3fP1oxbtTym_tv-UhW2K3pYD-A@mail.gmail.com>
 <20201118131322.7bae7622@gandalf.local.home>
 <CAE90CG4N+orfJ2PUygWk3T8LDN+mHEjRz7qhz29MsyH9DOzv3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE90CG4N+orfJ2PUygWk3T8LDN+mHEjRz7qhz29MsyH9DOzv3A@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Nov 18, 2020 at 08:30:48PM +0100, Evan Rudford wrote:
> I believe that Spectre and Meltdown are kind of orthogonal to many
> other security threats.
> Yes, I fully agree that Spectre and Meltdown need to be addressed, but
> I still consider arbitrary buffer overflows in parsing libraries as
> more dangerous than "typical" Spectre/Meltdown threats.

You do realize that the kernel does very little parsing, and doesn't
use any parsing libraries, right?

In any cases, do you have a specific proposal you'd like to make?  Or
do you have something specific you'd be interested in doing, yourself,
to help make things better?

						- Ted
