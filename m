Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8CEB67E;
	Wed,  8 Apr 2026 18:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775672214; cv=none; b=KRCiaED7WX8dCQ96phpk6wzUL/yCRdIIfLlxpVssE0fL63mMDctTLDRcMd+7QS972A4649Eg/q+RwxEmSWWAqsUNCB+RCBGjnT4/WZx91DlB1vP8eJLiCpklOsXbtXmX4exi+2RcAjxFMpFCGTKeNEagg3zzdedyK3RZ023+xWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775672214; c=relaxed/simple;
	bh=WCTmsAk4bx/xZwbU40e5dwbewPnydGz9zlTpoNY26AU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DkU7iu9jxb3ty4Qtt2mQxg/djNqb0j2p98vIf2gFCLJJJFT/2Chqhwt7XMOCMD+fskDKKSrD0/9sjtFRRswZJQZI56J1alcrdQkDc62CgpulBV+SGsgfcx2C/lLmu/YrgpcMoUUUmP3iYSdoN2lJv+yCEMsdU5ifti51Xm7NKYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 4246C1B7028;
	Wed,  8 Apr 2026 18:16:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 5D9412000F;
	Wed,  8 Apr 2026 18:16:42 +0000 (UTC)
Message-ID: <bbd86dd5a7e457d368f5875589cc78287ece4193.camel@perches.com>
Subject: Re: [PATCH v2] checkpatch: add --json output mode
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>, dwaipayanray1@gmail.com, 
	lukas.bulwahn@gmail.com
Cc: mricon@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	apw@canonical.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 08 Apr 2026 11:16:40 -0700
In-Reply-To: <20260408172435.1268067-1-sashal@kernel.org>
References: <20260406170039.4034716-1-sashal@kernel.org>
	 <20260408172435.1268067-1-sashal@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 5D9412000F
X-Stat-Signature: 1buihourwf9gportukr3gz48kyfz7tqd
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+cGa6Wr1P7N2dE/tHwpvref8MlZoUXYrc=
X-HE-Tag: 1775672202-820107
X-HE-Meta: U2FsdGVkX1/f7x5Z4rIcTVI/06sbkjagRW34jxx4c2cZaBfdrAlLVTv0ZzrJ4N/3m4bG6/iNZ2BgplCVYkb1jiMo9vOrY93b3XpmHaUQsJyAfe3tcJQlaqMrUPYYXiv61ZF3Xuk4nvLRp7AajWfgoOm0nEB50eJzz73WUMwIZDQU9r6L0+oMdtJRdXZkhIp+ZsWAwIDDTY1zAQSHwkqnKZLotbNEWRYVl5dFGhc+/cxJgHr/GEkkU/VJfGC030nq68nudU7mwl/S7CNPIup6WdxuJKvcRUdPetmH0zccfuzbNnX22mMJIkoBW1H+IWfU

On Wed, 2026-04-08 at 13:24 -0400, Sasha Levin wrote:

Adding --json seems sensible but some of the
added checkpatch code seems odd to me.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> @@ -2395,6 +2400,18 @@ sub report {
> =20
>  	push(our @report, $output);
> =20
> +	if ($json) {
> +		our ($realfile, $realline);

Seems an odd way to check if $realfile/$readline is set

> +		my %issue =3D (
> +			level =3D> $level,
> +			type =3D> $type,
> +			message =3D> $msg,
> +		);
> +		$issue{file} =3D $realfile if (defined $realfile && $realfile ne '');
> +		$issue{line} =3D $realline + 0 if (defined $realline && $realline);

All the uses of + 0 seem unnecessary, but I gather it's for
string/decimal conversions.

> +sub json_print_result {
> +	my ($filename, $total_errors, $total_warnings, $total_checks,
> +	    $total_lines, $issues, $used_types, $ignored_types) =3D @_;
> +	my %result =3D (
> +		filename       =3D> $filename,
> +		total_errors   =3D> $total_errors + 0,
> +		total_warnings =3D> $total_warnings + 0,
> +		total_checks   =3D> $total_checks + 0,
> +		total_lines    =3D> $total_lines + 0,
> +		issues         =3D> $issues,
> +	);
> +	$result{used_types} =3D $used_types if (defined $used_types);
> +	$result{ignored_types} =3D $ignored_types if (defined $ignored_types);
> +	my $json_encoder =3D JSON::PP->new->canonical->utf8;

Maybe add JSON pretty too?

> +	print $json_encoder->encode(\%result) . "\n";

Still missing parentheses around print args.
I do know  that not all existing print uses have parentheses.
I just prefer them to be more like C readable.

> +}
> +
>  sub fixup_current_range {
>  	my ($lineRef, $offset, $length) =3D @_;
> =20
> @@ -2690,14 +2724,15 @@ sub process {
>  	my $last_coalesced_string_linenr =3D -1;
> =20
>  	our @report =3D ();
> +	our @json_issues =3D ();
>  	our $cnt_lines =3D 0;
>  	our $cnt_error =3D 0;
>  	our $cnt_warn =3D 0;
>  	our $cnt_chk =3D 0;
> =20
>  	# Trace the real file/line as we go.
> -	my $realfile =3D '';
> -	my $realline =3D 0;
> +	our $realfile =3D '';
> +	our $realline =3D 0;

?

> @@ -7791,18 +7826,27 @@ sub process {
>  	# If we have no input at all, then there is nothing to report on
>  	# so just keep quiet.
>  	if ($#rawlines =3D=3D -1) {
> +		if ($json) {
> +			json_print_result($filename, 0, 0, 0, 0, []);
> +		}
>  		exit(0);
>  	}
> =20
>  	# In mailback mode only produce a report in the negative, for
>  	# things that appear to be patches.
>  	if ($mailback && ($clean =3D=3D 1 || !$is_patch)) {
> +		if ($json) {
> +			json_print_result($filename, 0, 0, 0, 0, []);
> +		}
>  		exit(0);
>  	}
> =20
>  	# This is not a patch, and we are in 'no-patch' mode so
>  	# just keep quiet.
>  	if (!$chk_patch && !$is_patch) {
> +		if ($json) {
> +			json_print_result($filename, 0, 0, 0, 0, []);
> +		}
>  		exit(0);
>  	}


Duplicated code, maybe use a function or consolidate the code?
Something like:

 	if (($#rawlines =3D=3D -1) ||
			# If we have no input, there's nothing to report
 	    ($mailback && ($clean =3D=3D 1 || !$is_patch)) ||
			# In mailback mode only produce a report for what seems to be a patch
 	    (!$chk_patch && !$is_patch)) {
			# This is not a patch, and we are in 'no-patch' mode.
		json_print_result($filename, 0, 0, 0, 0, []) if ($json);
 		exit(0);
 	}

> =20
> @@ -7850,6 +7894,13 @@ sub process {
>  		}
>  	}
> =20
> +	if ($json) {
> +		my @used =3D sort keys %use_type;
> +		my @ignored =3D sort keys %ignore_type;
> +		json_print_result($filename, $cnt_error, $cnt_warn,
> +				  $cnt_chk, $cnt_lines, \@json_issues,
> +				  \@used, \@ignored);
> +	} else {
>  	print report_dump();
>  	if ($summary && !($clean =3D=3D 1 && $quiet =3D=3D 1)) {
>  		print "$filename " if ($summary_file);
> @@ -7878,8 +7929,9 @@ NOTE: Whitespace errors detected.
>  EOM
>  		}
>  	}
> +	} # end !$json

I quite dislike misleading indentation.

Perhaps it's  unnecessary here and simpler to use an
exit in the new block at line 7850

> =20
> -	if ($clean =3D=3D 0 && $fix &&
> +	if (!$json && $clean =3D=3D 0 && $fix &&
>  	    ("@rawlines" ne "@fixed" ||
>  	     $#fixed_inserted >=3D 0 || $#fixed_deleted >=3D 0)) {
>  		my $newfile =3D $filename;
> @@ -7918,7 +7970,7 @@ EOM
>  		}
>  	}
> =20
> -	if ($quiet =3D=3D 0) {
> +	if (!$json && $quiet =3D=3D 0) {
>  		print "\n";
>  		if ($clean =3D=3D 1) {
>  			print "$vname has no obvious style problems and is ready for submissi=
on.\n";
>=20
