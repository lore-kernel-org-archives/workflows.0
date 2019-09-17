Return-Path: <SRS0=+Bhr=XM=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3275C4CECD
	for <workflows@archiver.kernel.org>; Tue, 17 Sep 2019 22:12:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B43BC2189D
	for <workflows@archiver.kernel.org>; Tue, 17 Sep 2019 22:12:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbfIQWMu (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 17 Sep 2019 18:12:50 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:58054 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbfIQWMu (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 17 Sep 2019 18:12:50 -0400
Received: from 79.184.255.25.ipv4.supernova.orange.pl (79.184.255.25) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id 67717c2e3d696450; Wed, 18 Sep 2019 00:12:48 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     workflows@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Date:   Wed, 18 Sep 2019 00:12:47 +0200
Message-ID: <5072394.GngetUhsyG@kreacher>
In-Reply-To: <1811089.yxvLMk49Ug@kreacher>
References: <1811089.yxvLMk49Ug@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Friday, September 13, 2019 10:22:20 AM CEST Rafael J. Wysocki wrote:
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
> 
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

And one more item from myself:

(d) Support for "maintainer views"

    That is, by default subsystem maintainers should see patches, bug reports
    etc against the code maintained by them, with the possibility to extend the
    view to also see the other submissions.

    [That kind of is the case in Patchwork today when patches sent to different
     mailing lists show up under different "projects", but the problem in there
     is that copies of one patch appear under multiple "projects" as different
     entities if sent to multiple lists.]

> 
> 6. Easy to set up (especially for local installations)
> 
> 7. Bug tracking support
> 
> I guess there are more items to be added to this list, so please extend it if
> you have any ideas and we'll see where this goes. :-)



