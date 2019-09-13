Return-Path: <SRS0=s0xN=XI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A38C49ED7
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 11:38:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D49DB20693
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 11:38:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SUoTwFMf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbfIMLiD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 13 Sep 2019 07:38:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43934 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbfIMLiD (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 13 Sep 2019 07:38:03 -0400
Received: from pendragon.ideasonboard.com (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1B6D33A;
        Fri, 13 Sep 2019 13:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568374681;
        bh=atinOaJdCGkBCP9h5YAfboT0c7WzITVy6k2TlBvJQfs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SUoTwFMfwK52zu9bTZ9GnxG35VuuSMR64TzDOkEWHMMjjV4jrQmNnCU9hsRj2Wstw
         /fT0+Uq0eig8U/AnXeIBtE7V2jUqI6QuXNsRxGgOhFm8EXnAkyxcIG7a04OWbQcGab
         HFF2t8u3HH0NVqr4c4y7SzXkpt8YynlewC/1NGa8=
Date:   Fri, 13 Sep 2019 14:37:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Message-ID: <20190913113753.GG29992@pendragon.ideasonboard.com>
References: <1811089.yxvLMk49Ug@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1811089.yxvLMk49Ug@kreacher>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Rafael,

On Fri, Sep 13, 2019 at 10:22:20AM +0200, Rafael J. Wysocki wrote:
> Hi All,
> 
> During the Maintainers Summit session yesterday I started to create a wish list
> for the new kernel development collaboration platform to be created (and to
> replace the multiple pieces of tooling in use today).  I also asked Bjorn,
> Jiri, Greg and Shuah for input and here's the reslut:
> 
> 1. Compatible with e-mail
> 
>   (a) E-mail send to it stored and included automatically; appears as part of
>       the normal flow.
> 
>   (b) Automatic e-mail responses
>       If e-mail is sent to it, the sender will get all responses to it in the
>       given thread by e-mail.
> 
> 2. History tracking
> 
>   (a) Should be able to track revisions of a given patch series (or patch) down
>       to the initial submission.
> 
> 3. Integration with git
> 
>   (a) Should be able to create git commits from patches (or patch series)
>       tracked by it if pointed to a git branch (either locally or remotely).
> 
>   (b) Link tags pointing back to it should be added automatically to git
>       commits created from patches tracked by it.

In addition to a link, should the tag message contain a copy of the
cover letter for the patch series ?

> 4. Distributed
> 
>   (a) Support for running offline.
> 
>   (b) Support for batch updates.
> 
>   (c) CL-frendly.
> 
> 5. Patchwork-like features
> 
>   (a) Delegation support.
> 
>   (b) Support for bundles and patch series manipulation.
> 
>   (c) Smart mbox (download all selected patches).
> 
> 6. Easy to set up (especially for local installations)
> 
> 7. Bug tracking support
> 
> I guess there are more items to be added to this list, so please extend it if
> you have any ideas and we'll see where this goes. :-)

-- 
Regards,

Laurent Pinchart
