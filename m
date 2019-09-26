Return-Path: <SRS0=FCe/=XV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E951C4360C
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 19:51:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4950B222C3
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 19:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569527507;
	bh=iAPGsPyww/tBY/ZL23FNXg4JNrSclCBcybzc+WFHyJU=;
	h=Date:From:To:Subject:List-ID:From;
	b=nhXOi/U9ejFapq+WkZ+J6F3/EpL/qV3yFqomA8f5CAA3o2dk4vLmBc7A5dQI2obz3
	 XU6hRztNHmdJw2L27LX5it41tkqvDaslI6MUuVbwaGT5+l6WOoMIU+SWbokeJOlz1a
	 NyW4WYJQXmb+CO2Ef2ssg+6/iYu8Z4iTP+0ac33E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728702AbfIZTvr (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 26 Sep 2019 15:51:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:45734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728643AbfIZTvq (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 26 Sep 2019 15:51:46 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11F6C222C3;
        Thu, 26 Sep 2019 19:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569527505;
        bh=iAPGsPyww/tBY/ZL23FNXg4JNrSclCBcybzc+WFHyJU=;
        h=Date:From:To:Subject:From;
        b=z/o5GjAXDg6eALc9itBGzwiTXBMt+ny1cNTLjh2alNYWO33XZ1w3jHECqfK41nf/V
         zFJHettOJFg4N8W5p3RZmuDR+vWg9mD7BZsnTCzzaPAjXRdoL6GTkPciD/mDpi5Wx8
         SrhJw6bQKyeBQdgvLQKS4hkcaz1hi9o1SAubhFF8=
Date:   Thu, 26 Sep 2019 21:51:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: script to check "Fixes:" tags
Message-ID: <20190926195143.GA1742392@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Since this list was created to share scripts, here's one that I
currently use to test that the "Fixes:" tags are correct on a commit.  I
run it on all patches that I accept into my trees, after getting emails
from Stephen one too many times :)

It's almost entirely based on Stephen's original script, but has been
changed a bit in formatting and usage to be a stand-alone script that
anyone can use.

To use:
	verify_fixes.sh GIT_RANGE

if all is good, script will print nothing out and exit with success.  If
there is a problem it will be printed out and the script will exit with
an error that you can check from any other program.

It it 'shellcheck' clean, but I'm sure that there are other things wrong
with it, so feel free to point out problems.

And should stuff like this be in the kernel tree itself?

thanks,

greg k-h

--tKW2IUtsqtDRztdT
Content-Type: application/x-sh
Content-Disposition: attachment; filename="verify_fixes.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/bash=0A# SPDX-License-Identifier: GPL-2.0=0A#=0A# Copyright (C) 2019=
 Stephen Rothwell <sfr@canb.auug.org.au>=0A# Copyright (C) 2019 Greg Kroah-=
Hartman <gregkh@linuxfoundation.org>=0A#=0A# Verify that the "Fixes:" tag i=
s correct in a kernel commit=0A#=0A# usage:=0A#	verify_fixes.sh GIT_RANGE=
=0A#=0A# To test just the HEAD commit do:=0A#	verify_fixes.sh HEAD^..HEAD=
=0A#=0A#=0A# Thanks to Stephen Rothwell <sfr@canb.auug.org.au> for the majo=
rity of this code=0A#=0A=0A# Only thing you might want to change here, the =
location of where Linus's git=0A# tree is on your system:=0ALinus_tree=3D"/=
home/gregkh/linux/work/torvalds/"=0A=0A####################################=
######=0A# No need to touch anything below here=0A=0Asplit_re=3D'^([Cc][Oo]=
[Mm][Mm][Ii][Tt])?[[:space:]]*([[:xdigit:]]{5,})([[:space:]]*)(.*)$'=0Anl=
=3D$'\n'=0Atab=3D$'\t'=0A=0Ahelp()=0A{=0A	echo "error, git range not found"=
=0A	echo "usage:"=0A	echo "	$0 GIT_RANGE"=0A	exit 1=0A}=0A=0A# Strip the le=
ading and training spaces from a string=0Astrip_spaces()=0A{=0A	[[ "$1" =3D=
~ ^[[:space:]]*(.*[^[:space:]])[[:space:]]*$ ]]=0A	echo "${BASH_REMATCH[1]}=
"=0A}=0A=0Averify_fixes()=0A{=0A	git_range=3D$1=0A	error=3D0=0A	commits=3D$=
(git rev-list --no-merges -i --grep=3D'^[[:space:]]*Fixes:' "${git_range}")=
=0A	if [ -z "$commits" ]; then=0A	        return 0=0A	fi=0A=0A	for c in $co=
mmits; do=0A=0A		commit_log=3D$(git log -1 --format=3D'%h ("%s")' "$c")=0A#=
			commit_msg=3D"In commit:=0A#	$commit_log=0A#"=0A			commit_msg=3D"Commit:=
 $commit_log=0A"=0A=0A		fixes_lines=3D$(git log -1 --format=3D'%B' "$c" |=
=0A				grep -i '^[[:space:]]*Fixes:')=0A=0A		while read -r fline; do=0A			[=
[ "$fline" =3D~ ^[[:space:]]*[Ff][Ii][Xx][Ee][Ss]:[[:space:]]*(.*)$ ]]=0A		=
	f=3D"${BASH_REMATCH[1]}"=0A#			fixes_msg=3D"	Fixes tag:=0A#		$fline=0A#	Ha=
s these problem(s):=0A#"=0A			fixes_msg=3D"	Fixes tag: $fline=0A	Has these =
problem(s):=0A"=0A			sha=3D=0A			subject=3D=0A			msg=3D=0A=0A			if [[ "$f" =
=3D~ $split_re ]]; then=0A				first=3D"${BASH_REMATCH[1]}"=0A				sha=3D"${B=
ASH_REMATCH[2]}"=0A				spaces=3D"${BASH_REMATCH[3]}"=0A				subject=3D"${BAS=
H_REMATCH[4]}"=0A				if [ "$first" ]; then=0A					msg=3D"${msg:+${msg}${nl}=
}${tab}${tab}- leading word '$first' unexpected"=0A				fi=0A				if [ -z "$s=
ubject" ]; then=0A					msg=3D"${msg:+${msg}${nl}}${tab}${tab}- missing subj=
ect"=0A				elif [ -z "$spaces" ]; then=0A					msg=3D"${msg:+${msg}${nl}}${t=
ab}${tab}- missing space between the SHA1 and the subject"=0A				fi=0A			el=
se=0A				printf '%s%s\t\t- %s\n' "$commit_msg" "$fixes_msg" 'No SHA1 recogn=
ised'=0A				commit_msg=3D''=0A				error=3D1=0A				continue=0A			fi=0A			if =
! git rev-parse -q --verify "$sha" >/dev/null; then=0A				printf '%s%s\t\t-=
 %s\n' "$commit_msg" "$fixes_msg" 'Target SHA1 does not exist'=0A				commit=
_msg=3D''=0A				error=3D1=0A				continue=0A			fi=0A=0A			if [ "${#sha}" -lt=
 12 ]; then=0A				msg=3D"${msg:+${msg}${nl}}${tab}${tab}- SHA1 should be at=
 least 12 digits long${nl}${tab}${tab}  Can be fixed by setting core.abbrev=
 to 12 (or more) or (for git v2.11${nl}${tab}${tab}  or later) just making =
sure it is not set (or set to \"auto\")."=0A			fi=0A			# reduce the subject=
 to the part between () if there=0A			if [[ "$subject" =3D~ ^\((.*)\) ]]; t=
hen=0A				subject=3D"${BASH_REMATCH[1]}"=0A			elif [[ "$subject" =3D~ ^\((.=
*) ]]; then=0A				subject=3D"${BASH_REMATCH[1]}"=0A				msg=3D"${msg:+${msg}=
${nl}}${tab}${tab}- Subject has leading but no trailing parentheses"=0A			f=
i=0A=0A			# strip matching quotes at the start and end of the subject=0A			=
# the unicode characters in the classes are=0A			# U+201C LEFT DOUBLE QUOTA=
TION MARK=0A			# U+201D RIGHT DOUBLE QUOTATION MARK=0A			# U+2018 LEFT SING=
LE QUOTATION MARK=0A			# U+2019 RIGHT SINGLE QUOTATION MARK=0A			re1=3D$'^[=
\"\u201C](.*)[\"\u201D]$'=0A			re2=3D$'^[\'\u2018](.*)[\'\u2019]$'=0A			re3=
=3D$'^[\"\'\u201C\u2018](.*)$'=0A			if [[ "$subject" =3D~ $re1 ]]; then=0A	=
			subject=3D"${BASH_REMATCH[1]}"=0A			elif [[ "$subject" =3D~ $re2 ]]; the=
n=0A				subject=3D"${BASH_REMATCH[1]}"=0A			elif [[ "$subject" =3D~ $re3 ]]=
; then=0A				subject=3D"${BASH_REMATCH[1]}"=0A				msg=3D"${msg:+${msg}${nl}=
}${tab}${tab}- Subject has leading but no trailing quotes"=0A			fi=0A=0A			=
subject=3D$(strip_spaces "$subject")=0A=0A			target_subject=3D$(git log -1 =
--format=3D'%s' "$sha")=0A			target_subject=3D$(strip_spaces "$target_subje=
ct")=0A=0A			# match with ellipses=0A			case "$subject" in=0A			*...)	subje=
ct=3D"${subject%...}"=0A				target_subject=3D"${target_subject:0:${#subject=
}}"=0A				;;=0A			...*)	subject=3D"${subject#...}"=0A				target_subject=3D"=
${target_subject: -${#subject}}"=0A				;;=0A			*\ ...\ *)=0A				s1=3D"${sub=
ject% ... *}"=0A				s2=3D"${subject#* ... }"=0A				subject=3D"$s1 $s2"=0A		=
		t1=3D"${target_subject:0:${#s1}}"=0A				t2=3D"${target_subject: -${#s2}}"=
=0A				target_subject=3D"$t1 $t2"=0A				;;=0A			esac=0A			subject=3D$(strip=
_spaces "$subject")=0A			target_subject=3D$(strip_spaces "$target_subject")=
=0A=0A			if [ "$subject" !=3D "${target_subject:0:${#subject}}" ]; then=0A	=
			msg=3D"${msg:+${msg}${nl}}${tab}${tab}- Subject does not match target co=
mmit subject${nl}${tab}${tab}  Just use${nl}${tab}${tab}${tab}git log -1 --=
format=3D'Fixes: %h (\"%s\")'"=0A			fi=0A			lsha=3D$(cd "$Linus_tree" && gi=
t rev-parse -q --verify "$sha")=0A			if [ -z "$lsha" ]; then=0A				count=3D=
$(git rev-list --count "$sha".."$c")=0A				if [ "$count" -eq 0 ]; then=0A		=
			msg=3D"${msg:+${msg}${nl}}${tab}${tab}- Target is not an ancestor of thi=
s commit"=0A				fi=0A			fi=0A=0A			if [ "$msg" ]; then=0A				printf '%s%s%s=
\n' "$commit_msg" "$fixes_msg" "$msg"=0A				commit_msg=3D''=0A				error=3D1=
=0A			fi=0A		done <<< "$fixes_lines"=0A	done=0A=0A	if [ ${error} -eq 1 ] ; =
then=0A		exit 1=0A	fi=0A}=0A=0Agit_range=3D$1=0A=0Aif [ "${git_range}" =3D=
=3D "" ] ; then=0A	help=0Afi=0A=0Averify_fixes "${git_range}"=0Aexit 0=0A
--tKW2IUtsqtDRztdT--
