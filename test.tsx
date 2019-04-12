import * as React from 'react';
import {
  createStyles,
  Theme,
  WithStyles,
  withStyles
} from '@material-ui/core';

// @ts-ignore 6133
const styles = (theme: Theme) => createStyles({

});

interface Props {

}

interface State {

}

class Test extends React.PureComponent<
  Props
  & WithStyles<typeof styles>,
  State
> {
  state = {

  }

  render = (): React.ReactNode => {
    return (
      <React.Fragment>

      </React.Fragment>
    );
  }
}

export default withStyles(styles)(Test);
