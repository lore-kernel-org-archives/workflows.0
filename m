Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EB6E748F8
	for <workflows@archiver.kernel.org>; Mon,  2 Oct 2023 17:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238594AbjJBREV (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 2 Oct 2023 13:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238458AbjJBREU (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 2 Oct 2023 13:04:20 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16527AB;
        Mon,  2 Oct 2023 10:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1696266256;
        bh=xU0lQadd79FKZ0nIWwG573DirwofiNfxexqTugOnujE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gfa5ExFb/qou+BSXCMHbqgjwuI2dFkE6+t4HV/hhWQNbwodQeNkiXfeqU4V6eCzZ/
         WQPiu8nAHRbOBKJF8iw3nQfGmx4ap4r/SvWZGKgcWpTSZE2n2iGZBYbE7z/Z2dr1uY
         c62SVwcMsVyUcuV1AZOn2zKxjtk+/VDgIkKPC4uY=
Date:   Mon, 2 Oct 2023 19:04:15 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: encourage direct notifications
 to reviewers
Message-ID: <4dd558eb-516d-4a92-8c6b-273877eb6751@t-8ch.de>
References: <20230927-docs-cc-reviewer-v1-1-2af46ceb2d3c@weissschuh.net>
 <ZRVDv2fiFyW2S0z1@infradead.org>
 <f4ce8205-93a6-4ef5-94c0-1fb8d261bcac@t-8ch.de>
 <ZRpkWXMiQjUJPszZ@infradead.org>
 <874jj9iihq.fsf@intel.com>
 <ZRqEQ2uxAlCyihS3@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZRqEQ2uxAlCyihS3@infradead.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 2023-10-02 01:50:11-0700, Christoph Hellwig wrote:
> On Mon, Oct 02, 2023 at 10:36:01AM +0300, Jani Nikula wrote:
> > On Sun, 01 Oct 2023, Christoph Hellwig <hch@infradead.org> wrote:
> > > On Fri, Sep 29, 2023 at 09:24:57AM +0200, Thomas Weißschuh wrote:
> > >> > This does not scale.
> > >> 
> > >> Could you elaborate in which way it doesn't scale?
> > >
> > > If I send a modest cross-subsystem series it often touches 20+
> > > subsystems.  Between mailing lists and maintainers that's usually
> > > already 60+ recipients.  If you now add a another 2-3 maintainers
> > > we're just going to hit limits in mail servers.
> > 
> > I thought this was about adding people who have commented on previous
> > versions to Cc. That's usually a very limited number.
> 
> Oh, that absolutely makes sense.  But maybe we need to stop overloading
> the term reviewer :)

Thanks Jani for fixing the misunderstanding!

I'll try to find some better wording.
