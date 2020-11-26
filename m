Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B1FC56202
	for <workflows@archiver.kernel.org>; Thu, 26 Nov 2020 19:51:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9862D21D91
	for <workflows@archiver.kernel.org>; Thu, 26 Nov 2020 19:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729363AbgKZTvL (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 26 Nov 2020 14:51:11 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:38326 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729352AbgKZTvL (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 26 Nov 2020 14:51:11 -0500
X-Greylist: delayed 327 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Nov 2020 14:51:11 EST
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 0CDBF1F86C;
        Thu, 26 Nov 2020 19:45:44 +0000 (UTC)
Date:   Thu, 26 Nov 2020 19:45:43 +0000
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org
Cc:     meta@public-inbox.org
Subject: WIP: searching all of lore
Message-ID: <20201126194543.GA30337@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Requires Tor, for now:

http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/all/
http://lore.czquwvybam4bgbro.onion/all/

It seems v3 onions with longer URLs are more secure, these days;
but requires newer Tor.

On Debian or RH-based systems, it's as easy as:
	<apt|yum> install tor torsocks

	# assuming w3m is installed:
	torsocks w3m http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/all/

Other browsers can configure SOCKS5 proxies to 127.0.0.1:9050
or be wrapped via torsocks (which uses LD_PRELOAD)

Disclaimers:

  I don't know much about Tor security (or security in general).
  I see Tor as an alternative to paying corrupt organizations
  (ICANN) and lets me self-host without a static IP address.

  I've also had numerous ISP and power outages this year,
  probably because more neighbors are home due to the pandemic,
  so don't expect 99.999% uptime, either.  And I'm a klutz who
  always trips over cables on (relatively) good days, and I've
  only had bad days since March :<

How to replicate
----------------

	# I'm using the following to update mirror and lore.kernel.org
	# (see grokmirror docs) for more.  Old command:
	grok-pull -v -c repos.conf
	public-inbox-index --all # update per-inbox indices

	# add "-L basic" or "-L medium" to reduce space requirements
	# to either -extindex or -index commands

	# The new command, not finalized yet:
	public-inbox-extindex --all -v /path/to/ALL


The following changes in a otherwise boring ~/.public-inbox/config
(or whatever $PI_CONFIG is set to)

; not yet stable or finalized, yet:
; this section allows, "all" is a special case, currently
[extindex "all"]
	topdir = /path/to/ALL

; these are already documented in public-inbox-config(5)
[publicinbox]
	; 'all' ignores domain name matching,
	; useful for inboxes served via multiple domains
	wwwlisting = all
	grokManifest = all

	; users with larger machines may want to bump this,
	; the default is for machines w/ 256MB RAM
	; (which I still use, sometimes)
	indexBatchSize = 100m

# I'm using the following to update from lore.kernel.org
# (see grokmirror docs) for more
grok-pull -v -c repos.conf
public-inbox-index --all # update per-inbox indices
public-inbox-extindex --all -v /path/to/ALL # index [extindex "all"]

This is running commit 95cb3e48fc5c4e847cdc111c2c8c9f0b70bdea56
git clone https://public-inbox.org/public-inbox.git

More changes coming (JMAP, speedups), and there's probably still
lots of stuff broken and need fixing (including my brain :<)
