Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995AFC433EF
	for <workflows@archiver.kernel.org>; Mon, 22 Nov 2021 14:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236131AbhKVOkT (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 22 Nov 2021 09:40:19 -0500
Received: from mga17.intel.com ([192.55.52.151]:48731 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235099AbhKVOkQ (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 22 Nov 2021 09:40:16 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="215507989"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; 
   d="scan'208";a="215507989"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 06:37:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; 
   d="scan'208";a="674083032"
Received: from rmcdonax-mobl.ger.corp.intel.com (HELO localhost) ([10.252.19.217])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 06:37:07 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Subject: Re: lore+lei: part 2, now with IMAP
In-Reply-To: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
Date:   Mon, 22 Nov 2021 16:37:04 +0200
Message-ID: <878rxgntnz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 12 Nov 2021, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> For our example query today, we'll do some stargazing. The following will show
> us all mail sent by Linus Torvalds:
>
>     f:torvalds AND rt:1.month.ago..

IMHO you're making the prefixes too short at the cost of not being clear
or easy to remember for the casual user. f? rt?

For example, the same query using Notmuch (which also uses Xapian as the
backend) would be:

	from:torvalds AND date:1month..

I'm not convinced the brevity is all good here, YMMV.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
