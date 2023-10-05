Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716ECE92706
	for <workflows@archiver.kernel.org>; Thu,  5 Oct 2023 14:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235430AbjJEOfh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbjJEOeG (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 5 Oct 2023 10:34:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5272B93C5;
        Thu,  5 Oct 2023 01:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=e/mzUYxWl3fr9gq+Bz67g+mc6v
        FBpy9Lv1P0KnS6daTxLUzeL6ad7PZNEIqvMACWEhUm87MQAWKHEnDH9hFENcR5lHYP+gNxaPoKVhP
        /NVVK9v5cEOTigBs+VPmT2uLRevypAJ8omQgoNYIUQpxSFVm5TMSknGncD2wC50BJD/fR+c1+NPDE
        bfwnXFHj1+RBPbJGfSMbd3dOKCeTBOiDqxF5xXZfCzGbjFyeHn+tVvBXU2KVBnKgSdRqTvYkiINIC
        GBlLIJEzbUf45CNA/MXjg7FULG9srcNBZryF4eC9x6E7L8imoWuNTgyE6r/Cz55OSgZKnASNoYx6L
        K4wbcH4w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1qoK3n-001iKN-2I;
        Thu, 05 Oct 2023 08:50:19 +0000
Date:   Thu, 5 Oct 2023 01:50:19 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@infradead.org>,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2] docs: submitting-patches: encourage direct
 notifications to commenters
Message-ID: <ZR54y3bvwLo7rAAh@infradead.org>
References: <20231003-docs-cc-reviewer-v2-1-f93fb946e21e@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003-docs-cc-reviewer-v2-1-f93fb946e21e@weissschuh.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

