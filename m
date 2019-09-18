Return-Path: <SRS0=PHiI=XN=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F47C4CEC4
	for <workflows@archiver.kernel.org>; Wed, 18 Sep 2019 13:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B49821920
	for <workflows@archiver.kernel.org>; Wed, 18 Sep 2019 13:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfIRNny (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 18 Sep 2019 09:43:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:50956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbfIRNny (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 18 Sep 2019 09:43:54 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15233208C0;
        Wed, 18 Sep 2019 13:43:53 +0000 (UTC)
Date:   Wed, 18 Sep 2019 09:43:51 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Message-ID: <20190918094351.3f3e9203@gandalf.local.home>
In-Reply-To: <878sqmxc5k.fsf@intel.com>
References: <1811089.yxvLMk49Ug@kreacher>
        <875zlwzbxv.fsf@intel.com>
        <2608348.dCUkSTB59S@kreacher>
        <878sqmxc5k.fsf@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 18 Sep 2019 11:05:11 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

> On Tue, 17 Sep 2019, "Rafael J. Wysocki" <rjw@rjwysocki.net> wrote:
> > Assuming that git is used to generate patches in the first place.
> >
> > Some people use different methods, like quilt, however.  
> 
> Well, perhaps it should be a requirement to use git to contribute to
> upstream kernel.
> 
> It doesn't prevent you from managing patches with whatever tools you
> want locally, go wild, but for contributing you'd have to shove them in
> a git tree.
> 
> I fully expect this to be shot down as a too radical idea. For the
> kernel. It's pretty normal everywhere else. Even though git was
> developed for the kernel.

I use a combination of quilt and git. But I would suggest that whatever
tool we come up with implements these "extras" via plugins. We should
define an abi such that if another tool is better for a workflow it can
be easily adapted.

-- Steve
