Return-Path: <SRS0=+Bhr=XM=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70750C4CEC9
	for <workflows@archiver.kernel.org>; Tue, 17 Sep 2019 18:48:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52132206C2
	for <workflows@archiver.kernel.org>; Tue, 17 Sep 2019 18:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfIQSsE (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 17 Sep 2019 14:48:04 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:41895 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfIQSsE (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 17 Sep 2019 14:48:04 -0400
X-Greylist: delayed 433 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Sep 2019 14:48:03 EDT
Received: from localhost.localdomain (p200300E9D7197E6749D60627680F4137.dip0.t-ipconnect.de [IPv6:2003:e9:d719:7e67:49d6:627:680f:4137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@datenfreihafen.org)
        by proxima.lasnet.de (Postfix) with ESMTPSA id F0D26C06D2;
        Tue, 17 Sep 2019 20:40:48 +0200 (CEST)
Subject: Re: Kernel development collaboration platform wish list
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <1811089.yxvLMk49Ug@kreacher>
From:   Stefan Schmidt <stefan@datenfreihafen.org>
Message-ID: <2664c41b-e97c-4667-fb90-2eb37affea14@datenfreihafen.org>
Date:   Tue, 17 Sep 2019 20:40:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1811089.yxvLMk49Ug@kreacher>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello.

Here is my Requirement For Comments (RFC).

On 13.09.19 10:22, Rafael J. Wysocki wrote:
> 
> 3. Integration with git
> 
>   (a) Should be able to create git commits from patches (or patch series)
>       tracked by it if pointed to a git branch (either locally or remotely).
> 
>   (b) Link tags pointing back to it should be added automatically to git
>       commits created from patches tracked by it.

(c) Git tag sanity checking
    Some maintainers have scripts for these, but not all. I still see
quite some mails about this coming from linux-next checking.
    1) ensure SOB by the actual author
    2) verify correct SOB/ACK/Reviewed tag usage (funny to see how often
things are manually added and gotten slightly wrong)
    3) verify Fixes: tag usage (min shasum length, one line without
break, etc)

There are likely more.

Where and how this is to be done I would leave open as this is only
requirements collection right now. I just feel that this kind of sanity
checking could be easily automated, hopefully without getting into the
way of maintainers.

regards
Stefan Schmidt
