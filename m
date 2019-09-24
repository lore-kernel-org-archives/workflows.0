Return-Path: <SRS0=lZea=XT=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DCAC432C1
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 05:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE33A214D9
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 05:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569301607;
	bh=sPFTk0Kf7pAzFjKxtbHYzW14o4qMQPJ+u/W1PUECQoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=axfIfazA2zF+g5wB/GOROf5kYZbMrwj4T9J0iwb5FiTMzKxa/ed9KFH5qVQK43kGS
	 02slR4cZXUWScwp3aH4KumQowoBP5xNtQNvsF8ttOT052Yc1WDTT8F2ZIUcQ9nYwMI
	 RX1JQci7rItBlxk8PLKWmezNQ5l7Uems94LTnP7Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405028AbfIXFGr (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 24 Sep 2019 01:06:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:36852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405014AbfIXFGr (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 24 Sep 2019 01:06:47 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24C4C20872;
        Tue, 24 Sep 2019 05:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569301606;
        bh=sPFTk0Kf7pAzFjKxtbHYzW14o4qMQPJ+u/W1PUECQoA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sr5Hi8uT0nhebmSXGbBSs1/bQqDl9l7FdYK2DJgB83BSNn/i6IO0GWBhuNzCF+4YY
         erJk3C0afkoK2o7jhJFl5EoFcuWbUdEFG7OqeKBXflKiAQcsH7WHzPz4t2DUEnV+kq
         Nbs6Sl1R8cvOsFlUsixmI/1uNANc/jtvNpDKtZTo=
Date:   Tue, 24 Sep 2019 07:06:44 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Message-ID: <20190924050644.GB3705@kroah.com>
References: <1811089.yxvLMk49Ug@kreacher>
 <20190923162001.GD6005@mit.edu>
 <20190924013920.GA22698@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924013920.GA22698@dcvr>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Sep 24, 2019 at 01:39:20AM +0000, Eric Wong wrote:
> I can't prove it, but it seems like public-inbox has been
> successful at promoting the use of Message-IDs in URLs and
> git-send-email :)

I can prove it, I'm using them in "Link:" tags to point to
lore.kernel.org for all patches I apply to the kernel tree now.  So
that's a few extra hundred links ever release that is happening :)

thanks,

greg k-h
