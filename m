Return-Path: <SRS0=FCe/=XV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBA6C4360C
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 19:54:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C84D222C3
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 19:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569527665;
	bh=pBTo1XXW5/zOcktgRzxZirbXHt38yMBD710HGumOyek=;
	h=Date:From:To:Subject:List-ID:From;
	b=JXpD21INT8zhcdK7LpQlFRfF2JpPTubc3jNGcapl/NMyFjVrXt7sBZ6jP9xxflkaO
	 R0JQaUUaWlEwKF9D06yz8zVNF+3ko81+0XBu/F71ZwBRLGzQB3fEmnqAaXHuo3nd4K
	 RELTgF6vdITPuPTLK9BzgaUpLbPfVua9DkvbzJrc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfIZTyY (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 26 Sep 2019 15:54:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:46828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727794AbfIZTyY (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 26 Sep 2019 15:54:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8AFE3222C3;
        Thu, 26 Sep 2019 19:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569527663;
        bh=pBTo1XXW5/zOcktgRzxZirbXHt38yMBD710HGumOyek=;
        h=Date:From:To:Subject:From;
        b=zpBE7Y9cUKDFwNT1QH1CX1cFe0B/vXOgVibwuRd+T0jBr7UghXWyuLy7Ip+VMIRjx
         sTM8h71Ghr+adZUvSk0Ub6OPK0sDe7Hncf2dlRtvP5szlaltN99D1vghu7s9jfpRiK
         FmXdH3EsfmNdP6nSoH0PFiunV86pcDy4wKoHhfxk=
Date:   Thu, 26 Sep 2019 21:54:20 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: script to check "Signed-off-by:" tags
Message-ID: <20190926195420.GB1742392@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Like the previous script, I use this one to check the validity of s-o-b
tags.

It too is mostly entirely Stephen's work, I've only changed a few minor
things and made it stand-alone.

To use:
	verify_signedoff.sh GIT_RANGE

if all is good, script will print nothing out and exit with success.  If
there is a problem it will be printed out and the script will exit with
an error that you can check from any other program.

It too is 'shellcheck' clean, but I'm sure that there are other things
wrong with it, so feel free to point out problems.

thanks,

greg k-h

--jq0ap7NbKX2Kqbes
Content-Type: application/x-sh
Content-Disposition: attachment; filename="verify_signedoff.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/bash=0A# SPDX-License-Identifier: GPL-2.0=0A#=0A# Copyright (C) 2019=
 Stephen Rothwell <sfr@canb.auug.org.au>=0A# Copyright (C) 2019 Greg Kroah-=
Hartman <gregkh@linuxfoundation.org>=0A#=0A# Verify that the signed-off-by =
chain looks correct for a range of git commits.=0A#=0A# usage:=0A#	verify_s=
ignedoff.sh GIT_RANGE=0A#=0A# To test just the HEAD commit do:=0A#	verify_s=
ignedoff.sh HEAD^..HEAD=0A#=0A#=0A# Thanks to Stephen Rothwell <sfr@canb.au=
ug.org.au> for the majority of this code=0A#=0A=0Ahelp()=0A{=0A	echo "error=
, git range not found"=0A	echo "usage:"=0A	echo "	$0 GIT_RANGE"=0A	exit 1=
=0A}=0A=0Averify_signedoff()=0A{=0A	git_range=3D$1=0A	error=3Dfalse=0A	for =
c in $(git rev-list --no-merges "${git_range}"); do=0A		ae=3D$(git log -1 -=
-format=3D'%ae' "$c")=0A		aE=3D$(git log -1 --format=3D'%aE' "$c")=0A		an=
=3D$(git log -1 --format=3D'%an' "$c")=0A		aN=3D$(git log -1 --format=3D'%a=
N' "$c")=0A		ce=3D$(git log -1 --format=3D'%ce' "$c")=0A		cE=3D$(git log -1=
 --format=3D'%cE' "$c")=0A		cn=3D$(git log -1 --format=3D'%cn' "$c")=0A		cN=
=3D$(git log -1 --format=3D'%cN' "$c")=0A		sob=3D$(git log -1 --format=3D'%=
b' "$c" | grep -i '^[[:space:]]*Signed-off-by:')=0A=0A		am=3Dfalse=0A		cm=
=3Dfalse=0A		grep -i -q "<$ae>" <<<"$sob" ||=0A			grep -i -q "<$aE>" <<<"$s=
ob" ||=0A			grep -i -q ":[[:space:]]*${an}[[:space:]]*<" <<<"$sob" ||=0A			=
grep -i -q ":[[:space:]]*${aN}[[:space:]]*<" <<<"$sob" ||=0A			am=3Dtrue=0A=
		grep -i -q "<$ce>" <<<"$sob" ||=0A			grep -i -q "<$cE>" <<<"$sob" ||=0A		=
	grep -i -q ":[[:space:]]*${cn}[[:space:]]*<" <<<"$sob" ||=0A			grep -i -q =
":[[:space:]]*${cN}[[:space:]]*<" <<<"$sob" ||=0A			cm=3Dtrue=0A=0A		if "$a=
m" || "$cm"; then=0A			printf "Commit %s\n" "$(git show -s --abbrev-commit =
--abbrev=3D12 --pretty=3Dformat:"%h (\"%s\")%n" "${c}")"=0A			"$am" && prin=
tf "\tauthor Signed-off-by missing\n"=0A			"$cm" && printf "\tcommitter Sig=
ned-off-by missing\n"=0A			printf "\tauthor email:    %s\n" "$ae"=0A			prin=
tf "\tcommitter email: %s\n"  "$ce"=0A			readarray -t s <<< "${sob}"=0A			p=
rintf "\t%s\n" "${s[@]}"=0A			printf "\n"=0A			error=3Dtrue=0A		fi=0A	done=
=0A	if "$error"; then=0A		echo "Errors in tree with Signed-off-by, please f=
ix!"=0A		exit 1=0A	fi=0A}=0A=0Agit_range=3D$1=0A=0Aif [ "${git_range}" =3D=
=3D "" ] ; then=0A	help=0Afi=0A=0Averify_signedoff "${git_range}"=0Aexit 0=
=0A
--jq0ap7NbKX2Kqbes--
