Return-Path: <SRS0=i7v8=ZG=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66415C432C3
	for <workflows@archiver.kernel.org>; Thu, 14 Nov 2019 06:29:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5617020709
	for <workflows@archiver.kernel.org>; Thu, 14 Nov 2019 06:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfKNG3K (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 14 Nov 2019 01:29:10 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:35644 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726190AbfKNG3K (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 14 Nov 2019 01:29:10 -0500
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 3B6FC1F4B5;
        Thu, 14 Nov 2019 06:29:10 +0000 (UTC)
Date:   Thu, 14 Nov 2019 06:29:09 +0000
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org
Subject: Re: RFC: using supersedes: trailer to indicate patch/series revision
 flow
Message-ID: <20191114062909.GA11649@dcvr>
References: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> Hi, all:
> 
> The only mechanism we currently have for patch/series versioning is
> subject suffixes. I think it would be useful to have a way to more
> explicitly mark that a series obsoletes a previous version, and I
> propose this is done with a `supersedes:` trailer at the end of the
> cover letter or in the first patch of the series:

<snip>

> Subject: [PATCH,v2] Change foo
> 
> Foo is no good. Use Bar. Also use baz.
> 
> Signed-off-by: Dev Eloper <dev.eloper@example.com>
> ---
>   foo | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/foo b/foo
> ...
> 
> supersedes: <1572991351-86061-1-git-send-email-dev.eloper@example.com>

This would works badly with limited bandwidth and storage
situations.

--interdiff and --range-diff options already give plenty of
useful info inline; and --range-diff can be enhanced to work
better in scenarios where there's enough storage/bandwidth for a
powerful search engine (--interdiff already does):

  Here's a quick PoC which allows --range-diff to be more useful
  to searcn engines (but the current regression is it's too
  noisy for human eyes, and making it less so requires more work):
  https://public-inbox.org/git/20191017121045.GA15364@dcvr/
  ("range-diff: show old/new blob OIDs in comments")

And search engine tooling still needs to be built around search
for better interdiff and range-diff blob expansion (since it
already exists for regular patches).
