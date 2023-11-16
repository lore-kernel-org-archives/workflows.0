Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C134C54FB9
	for <workflows@archiver.kernel.org>; Thu, 16 Nov 2023 13:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345228AbjKPN7W (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 16 Nov 2023 08:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345194AbjKPN7V (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 16 Nov 2023 08:59:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B14A9
        for <workflows@vger.kernel.org>; Thu, 16 Nov 2023 05:59:18 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF8AC433C8;
        Thu, 16 Nov 2023 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1700143157;
        bh=oreDXTUFD1p7EOCadmsrNnBKYaZXlHAjodag6YCr5sw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zWuN6oCTXkMwNE1HalrHk0dL6JJ8Ftpu1Xvijzw1uQn9ypVpax/WXZjD1QFBmkLsE
         7EEYSUUDX3B6/9BC9tYRVezGFj/V60Xt3IvQSHsbl9/N1ZBVfWPhyqCgJPwPbFkMMy
         sMUma/KePpFUutEufuw34VLxQDJI4skUef9Rk+/0=
Date:   Thu, 16 Nov 2023 08:59:13 -0500
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>,
        workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mark Brown <broonie@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Darrick J . Wong" <djwong@kernel.org>,
        Charles Han <hanchunchao@inspur.com>,
        Linux Kernel Unit Tests <kunit-dev@googlegroups.com>,
        Linux Kernel Self Tests <linux-kselftest@vger.kernel.org>,
        Veronika Kabatova <vkabatov@redhat.com>,
        CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
Message-ID: <2023111601-unsecured-decode-3fc1@gregkh>
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <ZVYXEry40HTCis00@archie.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVYXEry40HTCis00@archie.me>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Nov 16, 2023 at 08:20:18PM +0700, Bagas Sanjaya wrote:
> On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
> > Make scripts/checkpatch.pl ensure any added V: fields reference
> > documented test suites only, and output a warning if a change to a
> > subsystem doesn't certify the required test suites were executed,
> > if any.
> > 
> > If the test suite description includes a "Command", then checkpatch.pl
> > will output it as the one executing the suite. The command should run
> > with only the kernel tree and the regular developer environment set up.
> > But, at the same time, could simply output instructions for installing
> > any extra dependencies (or pull some automatically). The idea is to
> > get the developer into feedback loop quicker and easier, so they have
> > something to run and iterate on, even if it involves installing some
> > more stuff first. Therefore it's a good idea to add such wrappers to the
> > kernel tree proper and refer to them from the tests.rst.
> 
> Does it also apply to trivial patches (e.g. spelling or checkpatch fixes
> as seen on drivers/staging/)?

You are assuming that drivers/staging/ has actual tests :)
