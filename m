Return-Path: <SRS0=JBIR=XW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A74C4360C
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 18:03:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E29B5217D7
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 18:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569607407;
	bh=ls5vZV+8wD3w07QUfqIaZDaT+I1rKrmJBIK4BlCnL0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2Tc6070wX3hac3R3RhVgWpKvY2q8h0zaYyKHtmAH1fQe0KuT78C/zzZX5ngei94Ie
	 QTyoDFOlsN+6XZs/kQvtv+go9raChNJx+qHWpKoc6Vca37lui0Hh1D16TFPgdMQwRy
	 OAfWPb0OJKjXbx8JNYjk3p1KfpF2j0hXnC10z6jM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfI0SD0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 27 Sep 2019 14:03:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:50374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfI0SD0 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 27 Sep 2019 14:03:26 -0400
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2548820872;
        Fri, 27 Sep 2019 18:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569607405;
        bh=ls5vZV+8wD3w07QUfqIaZDaT+I1rKrmJBIK4BlCnL0U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qtgeIMMv152GmGb3mC7iiv4tvNVP+5osL8q48emp926VegGkO7E5vhs2zrOVc8mWI
         hVzr3qMgyomZpOuSzhmafSvbIFYWrsgpE3408JsdpA8g/HBZjuSjdKPlsA4jQ17BFq
         bqnhYGuTV63eB5/1w351fGaTqN3X9DMG+2UX0pCc=
Date:   Fri, 27 Sep 2019 20:03:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        workflows@vger.kernel.org
Subject: Re: script to check "Fixes:" tags
Message-ID: <20190927180315.GE1802011@kroah.com>
References: <20190926195143.GA1742392@kroah.com>
 <CAMuHMdUq3if8bF0KatS+gWSa4mBvGk0Z8oyoOpeUj=AMTYbMkA@mail.gmail.com>
 <CAL_Jsq+emonMWUdz9jxnc3pnvpijK6CMLq-0dOStQWuHiEw3zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+emonMWUdz9jxnc3pnvpijK6CMLq-0dOStQWuHiEw3zA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Sep 27, 2019 at 07:01:17AM -0500, Rob Herring wrote:
> I think we're looking at the problem the wrong way around. Stephen
> shouldn't have to be checking this, and neither should maintainers. It
> could be easily automated. We could have a checkpatch bot that runs
> some subset of checkpatch checks we agree are always errors like the
> ones here and replies to patches with the errors.

Sure, it would be nice to have that, but until someone sets that up to
run on all patches sent to mailing lists, we need something locally to
run to catch these things.

Also, many maintainers mess this up, I run these checks on trees I pull
from and I have caught errors that checkpatch wouldn't have caught due
to maintainers forgetting to sign off on things they are committing
somehow.  email tests wouldn't have caught that.

thanks,

greg k-h
