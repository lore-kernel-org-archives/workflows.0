Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58577C433EF
	for <workflows@archiver.kernel.org>; Tue, 11 Jan 2022 01:52:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346331AbiAKBwP (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 10 Jan 2022 20:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344455AbiAKBwO (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 10 Jan 2022 20:52:14 -0500
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F993C06173F
        for <workflows@vger.kernel.org>; Mon, 10 Jan 2022 17:52:14 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
        t=1641865932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GTOxHBotIcBTbQVrfBvSgF9kB5wPmaexkFre6FiKID8=;
        b=hh7t6rnuY5AwN1xjIhRqmm1M2VXfFu3Wjs080/FjGeKe93Qdw8fbboRe0eZfe7TQ1LyGz5
        ax1a2gXvw9XGdtOrl6xXC5juVV2adl9uXcat+FzqcmkzJBAuHOZL++0b+E2tzLBEhJbUqs
        6fkVV2CY2yVz6GW8T70MMxNB9fFk5DQRNLWeUwtjjFH4hThdLKliPlobDXTkJoKl457Aif
        O2/4L5sxdI0jLTak/q7aJdzGU1JLY3cXOyIg+OOeNSZ6LWQqrQf6NxHc+AAyeP+VWeiAM+
        jsebDt29tCYiRdPerRLcgecHguMf3EWPmShlqX0LRs6neFT59vbNrXMXjOpiVg==
From:   Kyle Meyer <kyle@kyleam.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Subject: Re: lore+lei: getting started
In-Reply-To: <20220110194037.GA66290@bhelgaas>
References: <20220110194037.GA66290@bhelgaas>
Date:   Mon, 10 Jan 2022 20:52:03 -0500
Message-ID: <874k6bghto.fsf@kyleam.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyleam.com
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Bjorn Helgaas writes:

>> To edit your saved search, just run `lei edit-search`. This will bring up your
>> $EDITOR with the configuration file lei uses internally:
>
> This isn't working for me.  With current public-inbox (07cd8973baf8
> ("Makefile.PL: fix useless use of push")), I get:
>
>   $ lei edit-search
>   usage: lei edit-search OUTPUT
>   E: OUTPUT not supplied
>   $ lei edit-search out
>   --no-save was used with out cwd=/home/bjorn
>
> Maybe I'm doing something wrong?

Specifying an output (a destination previously given to lei-q's
-o/--output/-mfolder) is required.  You can see which ones are available
with

  $ lei ls-search

> "lei help" and "lei --help" are not very useful because I can't figure
> out how to even get a list of the commands:
>
>   $ lei help | cat
>   usage: lei help [SUBCOMMAND]
>   show help
>
>   $ lei --help | cat
>   usage: lei COMMAND ...
>   ...
>
> lib/PublicInbox/LEI.pm *looks* like it has good help text in it, so
> maybe I'm doing something wrong.

`man lei` provides a pretty complete list of commands.
