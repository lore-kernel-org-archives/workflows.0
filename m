Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BA5C433F5
	for <workflows@archiver.kernel.org>; Mon, 10 Jan 2022 19:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243428AbiAJTkm (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 10 Jan 2022 14:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241122AbiAJTkl (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 10 Jan 2022 14:40:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502C5C06173F
        for <workflows@vger.kernel.org>; Mon, 10 Jan 2022 11:40:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EB878B8161F
        for <workflows@vger.kernel.org>; Mon, 10 Jan 2022 19:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75487C36AE3;
        Mon, 10 Jan 2022 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641843638;
        bh=DyhP0RxV4U4bi/Xoy2Al+9Y+bge0tDDkae+go3KYAeA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=dZL9xmlnIOWHzDVHwtBZ6+npKxUa3aHIoBN3w8+B3vmphg8vec5W7FfAVaT0lYxES
         N4rpLzn0n8Crkydw0JfTHx4P4zpFetxMHYw4r6Q6mfelPotx3Y0+rsCjs3ImII2r/c
         sPd1DpfrJztC1bGIkdENHtbQg2TQi5YS02unC++0r6DqB4Jjsc5WsUpSRxjo4s4v83
         34wadlooCOcLP27ATzd9Sqwi+D3FOdYkudZPNNHtWSWRtA7w8VOH50oJpZSPuCIV9y
         6ilVaQ4WEj5Uc7LOqsTv3MFlMVGdYq4DKu7+yWmn6q9n6zcZ6fOpe4w4geafW4eQOQ
         WkKtotIeOqRWw==
Date:   Mon, 10 Jan 2022 13:40:37 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Subject: Re: lore+lei: getting started
Message-ID: <20220110194037.GA66290@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

I'm really excited about lei; thanks very much for working on it!

On Fri, Nov 05, 2021 at 01:07:38PM -0400, Konstantin Ryabitsev wrote:
> By default, `lei -q` will save your search and start keeping track of it. To
> see your saved searches, run:

I think this is a typo for "lei q".  I only mention it because this
typo also appears in your blog:
https://people.kernel.org/monsieuricon/lore-lei-part-1-getting-started

> To edit your saved search, just run `lei edit-search`. This will bring up your
> $EDITOR with the configuration file lei uses internally:

This isn't working for me.  With current public-inbox (07cd8973baf8
("Makefile.PL: fix useless use of push")), I get:

  $ lei edit-search
  usage: lei edit-search OUTPUT
  E: OUTPUT not supplied
  $ lei edit-search out
  --no-save was used with out cwd=/home/bjorn

Maybe I'm doing something wrong?

"lei help" and "lei --help" are not very useful because I can't figure
out how to even get a list of the commands:

  $ lei help | cat
  usage: lei help [SUBCOMMAND]
  show help

  $ lei --help | cat
  usage: lei COMMAND ...
  ...

lib/PublicInbox/LEI.pm *looks* like it has good help text in it, so
maybe I'm doing something wrong.

Also their output gets piped through $PAGER by default, which isn't
super convenient.

Bjorn
