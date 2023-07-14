Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8887EB64DA
	for <workflows@archiver.kernel.org>; Fri, 14 Jul 2023 05:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234458AbjGNFFf (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 14 Jul 2023 01:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbjGNFFe (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 14 Jul 2023 01:05:34 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950CD2D40;
        Thu, 13 Jul 2023 22:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=xx2962OVdKvybh/3QZxjJMxEOcIZhNEbfw09t4MZaJo=; b=chGaa6Id1Oz3ayy1CliG2Kidiy
        llwvQMueZcsYLD8SghVTuj7XMHpCKqCDHbG+A6H6tfEIAmkfwvvWioaEojJTOfugf6DcvJD22Nb+y
        dW+yxpFK43/9z+k46AqML2ZACjy7ECVg2C3dxsYKCSxYiHthXfUTMw2fKlf4vRk6blGosSUnRSD1O
        v/e2i/5hZuo7/ELgk5brRtF0hfvAXdJBy1BspNkANvHXg1i6x4DncbJUoa7ZDEQSOHZs2DweMkpai
        1S7KoCMvsXEA8yCQ6iY8dKVzJDi9hxhCJEOiwhvEdnRU2+0xbKoh9e7w0GcDsULcCXv6SafkO4qKg
        sigKSIBw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qKAzX-000j4N-IF; Fri, 14 Jul 2023 05:05:19 +0000
Date:   Fri, 14 Jul 2023 06:05:19 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH docs] docs: maintainer: document expectations of small
 time maintainers
Message-ID: <ZLDXjzbp5tJ3UjjP@casper.infradead.org>
References: <20230713223432.1501133-1-kuba@kernel.org>
 <6f1014cd-f8c5-f935-dcc7-4f5a6b85e473@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1014cd-f8c5-f935-dcc7-4f5a6b85e473@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jul 14, 2023 at 06:36:41AM +0200, Krzysztof Kozlowski wrote:
> On 14/07/2023 00:34, Jakub Kicinski wrote:
> > +Responsibilities
> > +================
> > +
> > +The amount of maintenance work is usually proportional to the size
> > +and popularity of the code base. Small features and drivers should
> > +require relatively small amount of care and feeding. Nonetheless
> > +when the work does arrive (in form of patches which need review,
> > +user bug reports etc.) it has to be acted upon very promptly.
> > +Even when single driver only sees one patch a month, or a quarter,
> > +a subsystem could well have a hundred such drivers. Subsystem
> > +maintainers cannot afford to wait a long time to hear from reviewers.
> > +
> > +The exact expectations on the review time will vary by subsystem
> > +from 1 day (e.g. networking) to a week in smaller subsystems.
> 
> Two weeks is the upper limit.

Indeed.  People need to be able to take holiday.  Maybe this is
partially covered by "multiple maintainers", but even so, it is
unreasonable to expect this kind of responsiveness.

