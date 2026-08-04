Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A40D4746A3;
	Tue,  4 Aug 2026 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860622; cv=none; b=L3DyIq+Mla7Sj9LfEeHs6aiqiWwbMqhQ9OIvJEYN2ImNdj4CNQus1saq23rUQBDmBLICB7NWkyts20FPLmE7wEJ+jGDpDDbu5WBqtBmACLbnvcx+9Ix1NO4DULP+09AtMK7jHSMb7Nww/FAooNMxiCj0G7jOv7NpOkQ7i788sqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860622; c=relaxed/simple;
	bh=x0lrLjMO049daWH6ZFZUlJJEwxDoyvW5RpOEG2v1ot0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sktJcAth1T3tzTAEg5Xk5SUeg9DyVbGkXMBFmk1fslLDY3zn8+XO2EF2OoH9uvoFSdcCZMWN5Rysz1SnzVNoyxQ1oaa3SMiYT6skNX0R4CpfvoJn3M6NqTdW+UEdBFPaTl4yAG/0AyNRpIlubsJFoylECALmmtWifA3tu8MFOYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 143808023B;
	Tue,  4 Aug 2026 16:23:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id D765920028;
	Tue,  4 Aug 2026 16:23:30 +0000 (UTC)
Message-ID: <8b5e0ec009487b8e28210ce490e7182207466298.camel@perches.com>
Subject: Re: [PATCH] checkpatch.pl: adapt to new Assisted-by: format
From: Joe Perches <joe@perches.com>
To: Jeff Layton <jlayton@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Christian Brauner
 <brauner@kernel.org>, 	linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
Date: Tue, 04 Aug 2026 09:23:29 -0700
In-Reply-To: <20260804-checkpatch-v1-1-27f29c79a46f@kernel.org>
References: <20260804-checkpatch-v1-1-27f29c79a46f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: 1t86wuecbq6xh6rgrkfqqj6ginxh5k6p
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: D765920028
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+mA9Fwl168gbOXkHCix8pms5FP4ebcMug=
X-HE-Tag: 1785860610-387806
X-HE-Meta: U2FsdGVkX1+WvqdKo+/If5mMveRNCs4MsxOAQdZjczHfo/MaL/pjgDH1UyFmCeRjBWrIECTkiYGFBhoAnAFQCWMr5M32K/uNEfSa9nKEMEBYmH6KfQSGQBUQ91F7ZjB/lDcpfd5LJT3GrdISrEbxOkQc1N0T+VhqmukDtkJ3tPdbAEoibNDKuEQCQQBNu4CIuLc9RsXx43kFjPhdmvNEyVb51FX43qIURsqQ0Dq7JIbI4dC5FrOHKm+7x0AuUFsszAIqpjv93UB66zGTFmOJQtxo6gapfvzJWuvDxC1IMNZfQgqteXoSJ8s4Uy5wWOKSIaRRXftKUhc3iactzO53E5b01kvNX8KXZ1Q/d8Ocstp6ClEfxp1gO5LpL2GGkEZ1Y41KB168f1YRsabxAcoCIw==

On Tue, 2026-08-04 at 12:13 -0400, Jeff Layton wrote:
> There is a new format for the 'Assisted-by:' tag. Change checkpatch.pl
> to just check that it has a value rather than testing for a specific
> format.
>=20
> Assisted-by: LLM

Did an LLM really help produce this?  Why?

> Signed-off-by: Jeff Layton <[jlayton@kernel.org](mailto:jlayton@kernel.or=
g)>
> ---
> This is a companion patch to the one to change the format in
> Documentation/. See:
>=20
>     [https://lore.kernel.org/workflows/87qzkuahlr.fsf@trenco.lwn.net/](ht=
tps://lore.kernel.org/workflows/87qzkuahlr.fsf@trenco.lwn.net/)
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3124,11 +3124,12 @@ sub process {
>  				}
>  			}
> =20
> -			# Assisted-by uses AGENT_NAME:MODEL_VERSION format, not email
> +			# Assisted-by uses a free-form value (e.g. "LLM"), not an
> +			# email address, so skip the email format checks below.
>  			if ($sign_off =3D~ /^Assisted-by:/i) {And
> -				if ($email !~ /^\S+:\S+/) {
> +				if ($email =3D~ /^\s*$/) {
>  					WARN("BAD_SIGN_OFF",
> -					     "Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]=
' format\n" . $herecurr);
> +					     "Assisted-by requires a value\n" . $herecurr);
>  				}
>  				next;
>  			}
>=20
[]
> Best regards,

Sure, whatever.

cheers
